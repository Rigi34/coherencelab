# Relancer Claude Code depuis Termux

## Démarrage rapide (copie-colle ces 3 lignes)
```bash
proot-distro login ubuntu
cd /root/coherencelab
claude
```

---

## Détail des étapes

## 1. Ouvrir Termux, puis entrer dans le système Linux
```bash
proot-distro login ubuntu
```

## 2. Aller dans le dossier de travail
```bash
cd /root/coherencelab
```

## 3. Lancer Claude Code
```bash
claude
```

---

## Commandes utiles dans Claude Code

| Action | Commande |
|---|---|
| Créer un fichier | `Write` ou demande en français |
| Créer des dossiers | `mkdir -p dossier/{a,b,c}` |
| Lister les fichiers | `ls` |
| Quitter Claude Code | `/exit` ou `Ctrl+C` |

---

## En cas de problème
- Si `claude` n'est pas trouvé : `npm install -g @anthropic-ai/claude-code`
- Si Termux freeze : fermer et rouvrir l'app

> Fichier créé le 2026-05-10
