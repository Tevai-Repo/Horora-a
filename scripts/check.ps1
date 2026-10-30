# Porte de qualite du projet Horora'a. Depuis le Kit v0 (2026-10-21), installe le 2026-10-29. PowerShell 5.1.
# Ce fichier appartient au projet. Il appelle d'abord la partie Kit, scripts/check.kit.ps1, qu'il ne modifie jamais
# (suffixe .kit, verrou harnais.lock), puis ses propres etapes. Une mise a jour du Kit remplace check.kit.ps1 ; ce fichier reste.
# Usage : powershell -File scripts/check.ps1          (complet : etapes rapides, puis compilation, tests, audit)
#         powershell -File scripts/check.ps1 -Fast    (rapide : le Kit et les controles sans compilation ; hook pre-commit)
# Vert = toutes les etapes passent. Rouge = premiere etape en echec, arret immediat.
# Les etapes marquees <A REMPLIR> sont propres au projet ; vides tant qu'aucun code n'existe, remplies avec le premier jalon. Pas d'accent dans ce fichier : PS 5.1 lit un .ps1 sans BOM en ANSI.

param([switch]$Fast)

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

# --- 1. La partie Kit : controle-kit, controle-taille, controle-spec. Ne pas modifier ici. ---------------------------------
Etape "Kit : scripts/check.kit.ps1" {
    & powershell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $root "scripts/check.kit.ps1")
    if ($LASTEXITCODE -ne 0) { $global:LASTEXITCODE = 1 }
}

# --- 2. <A REMPLIR> : le formatage du langage, en mode verification ------------------------------------
# Exemple FANA : cargo fmt --check. Le hook pre-commit appartient au Kit ; le formatage vit ici.
# Etape "<Langage> : format" { <commande de formatage en mode verification> }

# --- 3. <A REMPLIR> : les controles rapides du projet -------------------------------------------------
# Un controle = une fonction Controle-<Nom>, un message qui cite son code, $global:LASTEXITCODE a 1 si rouge.
# Exemples sur FANA : controle-deps (toute dependance a sa ligne dans DECISIONS.md), controle-html, controle-innerhtml.
# Etape "C-<CODE> : <ce qui est verifie>" { Controle-<Nom> }

if ($Fast) {
    Write-Host ""
    Write-Host "VERT (rapide) : Kit (controle-kit, controle-taille, controle-spec) passe ; aucun controle rapide propre au projet pour l'instant." -ForegroundColor Green
    exit 0
}

# --- 4. <A REMPLIR> : compilation, tests, audit, controles lents -------------------------------------
# Etape "<Langage> : compilation" { <commande, par exemple powershell -File scripts/build.ps1> }
# Etape "<Langage> : tests" { <commande> }
# Etape "Audit des dependances" { <commande, ou etape ignoree en jaune si l'outil manque> }

Write-Host ""
Write-Host "VERT : porte de qualite complete passee." -ForegroundColor Green
exit 0
