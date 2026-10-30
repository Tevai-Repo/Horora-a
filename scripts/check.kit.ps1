# Partie Kit de la porte de qualite. Fichier du Kit v0 (2026-10-22) : le suffixe .kit dit qu'il ne se modifie
# que par la porte-kit (IMMUABLES.md). Son empreinte est dans harnais.lock ; toute edition hors porte-kit est rouge.
# Appele par scripts/check.ps1, la partie du projet. Pas d'accent dans ce fichier : PS 5.1 lit un .ps1 sans BOM en ANSI.
# Usage : powershell -File scripts/check.kit.ps1                 les controles du Kit : controle-kit, controle-taille, controle-spec
#         powershell -File scripts/check.kit.ps1 -EcrireVerrou   ecrit harnais.lock ; l'integrateur, a la porte-kit seulement
# Les messages qui commencent par controle-<sujet> viennent d'un controle de pilotage/CONTROLES.md.

param([switch]$EcrireVerrou)

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $root

function Etape($nom, $bloc) {
    Write-Host ""
    Write-Host "=== $nom ===" -ForegroundColor Cyan
    $global:LASTEXITCODE = 0
    & $bloc
    if ($LASTEXITCODE -ne 0) {
        Write-Host "ROUGE : $nom" -ForegroundColor Red
        exit 1
    }
}
function Chemin-Relatif($f) { return ((Resolve-Path -Relative $f).TrimStart('.', '\', '/') -replace '\\', '/') }

# --- Le verrou : les fichiers du Kit et leurs empreintes (CONTROLES.md, controle-kit ; decision-fabrication-14, decision-fabrication-16) ---------
# Couverts : tout fichier dont le nom porte .kit. (hors .git), plus les fichiers du Kit dont l'outil impose le nom.
$FichiersNomImpose = @(".githooks/pre-commit")
function Fichiers-Kit {
    $l = @()
    foreach ($f in Get-ChildItem -Path . -Recurse -File -Filter "*.kit.*" | Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' }) { $l += (Chemin-Relatif $f.FullName) }
    foreach ($f in $FichiersNomImpose) { if (Test-Path -LiteralPath $f) { $l += $f } }
    return @($l | Sort-Object -Unique)
}
function Empreinte($chemin) { return (Get-FileHash -LiteralPath $chemin -Algorithm SHA256).Hash.ToLower() }

if ($EcrireVerrou) {
    $lignes = @("# harnais.lock : empreintes SHA-256 des fichiers du Kit. Ecrit par scripts/check.kit.ps1 -EcrireVerrou a la porte-kit. Ne pas editer.")
    $couverts = Fichiers-Kit
    foreach ($f in $couverts) { $lignes += ((Empreinte $f) + "  " + $f) }
    [IO.File]::WriteAllLines((Join-Path $root "harnais.lock"), $lignes, (New-Object System.Text.UTF8Encoding($false)))
    Write-Host "harnais.lock ecrit : $($couverts.Count) fichier(s) du Kit"
    exit 0
}

# --- controle-kit : les immuables du Kit existent, sont coherents, et n'ont pas bouge hors porte-kit -----------
# La liste verifiee est ici ; ce qui est fige sans etre verifie est dans IMMUABLES.md du Kit.
$CheminsImmuables = @(
    "harnais.toml", "AGENTS.md",
    "pilotage/ETAT.md", "pilotage/TACHES.md", "pilotage/QUESTIONS.md", "pilotage/DECISIONS.md",
    "pilotage/ROADMAP.md", "pilotage/SPEC.md", "pilotage/CONTRAT.md", "pilotage/CONTROLES.md",
    "pilotage/roles", "reflexion/journal-pilotage.md"
)
function Controle-Kit {
    $manques = @()
    $declares = @()
    foreach ($c in $CheminsImmuables) { if (-not (Test-Path -LiteralPath $c)) { $manques += "$c manque" } }
    if (Test-Path -LiteralPath "harnais.toml") {
        $toml = Get-Content -LiteralPath "harnais.toml" -Raw -Encoding UTF8
        if ($toml -notmatch '(?m)^\s*kit_version\s*=\s*"[^"]+"') { $manques += "harnais.toml sans kit_version" }
        $mr = [regex]::Match($toml, '(?m)^\s*roles\s*=\s*\[([^\]]*)\]')
        if (-not $mr.Success) {
            $manques += "harnais.toml sans ligne roles"
        } else {
            $declares = @([regex]::Matches($mr.Groups[1].Value, '"([^"]+)"') | ForEach-Object { $_.Groups[1].Value })
            if ($declares.Count -eq 0) { $manques += "harnais.toml : roles vide" }
            foreach ($r in $declares) {
                if (-not (Test-Path -LiteralPath "pilotage/roles/$r.md")) { $manques += "role declare sans fichier : $r (pilotage/roles/$r.md)" }
            }
            foreach ($f in Get-ChildItem -Path "pilotage/roles/*.md" -File -ErrorAction SilentlyContinue) {
                if ($f.BaseName -ne "README" -and $declares -notcontains $f.BaseName) { $manques += "fichier de role non declare dans harnais.toml : pilotage/roles/$($f.Name)" }
            }
        }
    }
    $couverts = Fichiers-Kit
    if (-not (Test-Path -LiteralPath "harnais.lock")) {
        $manques += "harnais.lock manque : a ecrire par l'integrateur a la porte-kit (scripts/check.kit.ps1 -EcrireVerrou)"
    } else {
        $verrou = @{}
        foreach ($l in Get-Content -LiteralPath "harnais.lock" -Encoding UTF8) { if ($l -match '^([0-9a-f]{64})\s+(.+)$') { $verrou[$Matches[2].Trim()] = $Matches[1] } }
        foreach ($f in $couverts) {
            if (-not $verrou.ContainsKey($f)) { $manques += "$f absent de harnais.lock : fichier du Kit ajoute hors porte-kit" }
            elseif ((Empreinte $f) -ne $verrou[$f]) { $manques += "$f modifie hors porte-kit : empreinte differente de harnais.lock" }
        }
        foreach ($f in $verrou.Keys) { if (-not (Test-Path -LiteralPath $f)) { $manques += "$f dans harnais.lock mais absent" } }
    }
    if ($manques.Count -gt 0) {
        foreach ($m in $manques) { Write-Host "controle-kit : $m" -ForegroundColor Red }
        Write-Host "controle-kit : un immuable du Kit manque, est incoherent ou a bouge hors porte-kit (IMMUABLES.md du Kit). Restaurer : git checkout HEAD -- <chemin>" -ForegroundColor Red
        $global:LASTEXITCODE = 1
    } else {
        Write-Host "controle-kit : $($CheminsImmuables.Count) chemins presents, $($declares.Count) role(s) declare(s) avec leur fichier, $($couverts.Count) fichier(s) du Kit conformes au verrou"
        $global:LASTEXITCODE = 0
    }
}

# --- controle-taille : les fichiers lus au demarrage d'une session restent courts ---------------------------
# Limites en Ko de 1 024 octets, sur la copie de travail (CONTROLES.md, controle-taille).
# Un fichier est mesure une fois, contre la premiere limite qui le nomme : la limite propre avant le motif general.
$LimitesTaille = [ordered]@{
    "AGENTS.md"           = 15
    "pilotage/ETAT.md"    = 30
    "pilotage/TACHES.md"  = 60
    "pilotage/roles/documentaliste.md" = 10
    "pilotage/roles/*.md" = 8
}
function Controle-Taille {
    $trop = @()
    $vus = 0
    $mesures = @{}
    foreach ($motif in $LimitesTaille.Keys) {
        $limite = $LimitesTaille[$motif]
        foreach ($f in Get-ChildItem -Path $motif -File -ErrorAction SilentlyContinue) {
            if ($mesures.ContainsKey($f.FullName)) { continue }
            $mesures[$f.FullName] = $true
            $vus++
            if ($f.Length -gt $limite * 1KB) { $trop += "$(Chemin-Relatif $f.FullName) fait $($f.Length) octets, limite $limite Ko ($($limite * 1KB) octets)" }
        }
    }
    if ($vus -eq 0) {
        # Regle du zero (CONTROLES.md) : un controle qui ne trouve rien a controler est rouge, jamais vert.
        Write-Host "controle-taille : aucun fichier lu au demarrage trouve (AGENTS.md, pilotage/ETAT.md, pilotage/TACHES.md, pilotage/roles/) : rien a controler est rouge" -ForegroundColor Red
        $global:LASTEXITCODE = 1
    } elseif ($trop.Count -gt 0) {
        foreach ($t in $trop) { Write-Host "controle-taille : $t : archiver dans pilotage/archives/, comptes rendus dans pilotage/comptes-rendus/" -ForegroundColor Red }
        $global:LASTEXITCODE = 1
    } else {
        Write-Host "controle-taille : $vus fichier(s) lus au demarrage, tous sous leur limite"
        $global:LASTEXITCODE = 0
    }
}

# --- controle-spec : la forme des specs et des changements (CONTROLES.md, controle-spec ; decision-fabrication-8, decision-fabrication-9) ----------------
# Rouge si le validateur echoue, rouge si le programme manque : jamais un vert silencieux.
# Le programme est installe par le pilote seul (controle-install). Jamais essaye dans les deux sens : voir CONTROLES.md.
function Controle-Spec {
    if (-not (Test-Path "openspec")) {
        Write-Host "controle-spec : pas de dossier openspec/ dans ce projet, controle ignore"
        $global:LASTEXITCODE = 0
        return
    }
    if (-not (Get-Command openspec -ErrorAction SilentlyContinue)) {
        Write-Host "controle-spec : openspec absent sur ce poste, a installer par le pilote (npm install -g @fission-ai/openspec@1.14.3)" -ForegroundColor Red
        $global:LASTEXITCODE = 1
        return
    }
    $env:OPENSPEC_NO_UPDATE_CHECK = "1"
    & openspec validate --all --strict --no-interactive
    if ($LASTEXITCODE -ne 0) {
        Write-Host "controle-spec : une spec ou un changement n'a pas la forme attendue (voir ci-dessus)" -ForegroundColor Red
        $global:LASTEXITCODE = 1
    } else {
        Write-Host "controle-spec : specs et changements valides"
        $global:LASTEXITCODE = 0
    }
}

Etape "controle-kit : immuables du Kit presents, coherents, verrou respecte" { Controle-Kit }
Etape "controle-taille : fichiers lus au demarrage" { Controle-Taille }
Etape "controle-spec : forme des specs et des changements" { Controle-Spec }
exit 0
