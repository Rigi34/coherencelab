# PROJET SITE — Régis Copywriter Freelance
*Créé le 2026-05-11 — Mis à jour à chaque déploiement*

---

## SITE EN LIGNE

| | |
|---|---|
| **URL principale** | https://regis-copy.vercel.app |
| **Dashboard Vercel** | https://vercel.com/rigi34000-2908s-projects/regis-copy |
| **Inspection déploiement** | https://vercel.com/rigi34000-2908s-projects/regis-copy/2VikioZyQYLmCYb57y2WMxp77WPn |
| **Compte Vercel** | rigi34000@gmail.com |
| **Projet Vercel** | regis-copy |

---

## PAGES DU SITE

| Page | URL | Fichier source |
|---|---|---|
| Accueil | `/` | `src/app/page.tsx` |
| Services | `/services` | `src/app/services/page.tsx` |
| Blog (liste) | `/blog` | `src/app/blog/page.tsx` |
| Article individuel | `/blog/[slug]` | `src/app/blog/[slug]/page.tsx` |
| Contact | `/contact` | `src/app/contact/page.tsx` |
| API contact | `/api/contact` | `src/app/api/contact/route.ts` |

---

## STRUCTURE DES FICHIERS

```
/root/regis-copy/
│
├── content/posts/              ← ARTICLES DE BLOG (.md)
│   ├── courir-apres-50-ans-talon.md
│   └── copywriter-specialise-sante-sport.md
│
├── src/app/
│   ├── layout.tsx              ← Navigation + Footer (toutes les pages)
│   ├── globals.css             ← Couleurs et styles globaux
│   ├── page.tsx                ← Page d'accueil
│   ├── services/page.tsx       ← Page services
│   ├── blog/page.tsx           ← Liste des articles
│   ├── blog/[slug]/page.tsx    ← Article individuel (automatique)
│   ├── contact/page.tsx        ← Formulaire de contact
│   └── api/contact/route.ts    ← API envoi email
│
├── GUIDE.md                    ← Guide complet d'utilisation
├── PROJET-SITE.md              ← Ce fichier
└── package.json
```

---

## WORKFLOW DE PUBLICATION

### Démarrage (chaque session)
```bash
proot-distro login ubuntu
cd /root/regis-copy
npm run dev
# Site visible sur http://localhost:3000
```

### Ajouter un article de blog
```bash
nano content/posts/mon-sujet.md
```
Format minimal :
```
---
title: "Titre de l'article"
date: "2026-05-15"
excerpt: "Une phrase résumé"
category: "Copywriting"
---
Contenu en Markdown...
```
→ L'article apparaît automatiquement dans le blog.

### Modifier une page
```bash
nano src/app/page.tsx          # Accueil
nano src/app/services/page.tsx # Services
nano src/app/layout.tsx        # Navigation
nano src/app/globals.css       # Couleurs
```
Ou demander à Claude de modifier directement.

### Mettre en ligne après modification
```bash
cd /root/regis-copy
vercel --prod
```
→ En ligne en ~30 secondes.

### Changer les couleurs
Dans `src/app/globals.css` :
```css
--accent: #e8623a;   ← Orange (boutons, accents)
--bg: #0b0b0b;       ← Fond noir
--fg: #f0ede8;       ← Texte principal
--border: #1e1e1e;   ← Bordures
--card: #111;        ← Fond des cartes
```

---

## INFOS VERCEL

| | |
|---|---|
| **Plan** | Hobby (gratuit) |
| **Région de build** | Washington DC (iad1) |
| **Framework détecté** | Next.js 16.2.6 |
| **Durée de build** | ~25 secondes |
| **ID déploiement** | dpl_2VikioZyQYLmCYb57y2WMxp77WPn |
| **Commande build** | `npm run build` |
| **Répertoire sortie** | `.next` |

---

## PROCHAINES ÉTAPES

### Étape 1 — Domaine personnalisé
Ajouter `regis-copywriter.fr` (ou `.com`) au site.

**Coût** : ~12€/an chez OVH, Namecheap ou Porkbun.

**Procédure :**
1. Acheter le domaine chez un registrar
2. Aller sur https://vercel.com/rigi34000-2908s-projects/regis-copy/settings/domains
3. Cliquer "Add Domain" → entrer le domaine
4. Vercel affiche 2 enregistrements DNS à configurer chez le registrar :
   - Type `A` → IP Vercel
   - Type `CNAME` → `cname.vercel-dns.com`
5. Attendre 5-30 minutes → HTTPS automatique (Let's Encrypt)

**Domaines recommandés :**
- `regis-copy.fr`
- `regiscopywriter.fr`
- `regis-freelance.fr`

---

### Étape 2 — Email fonctionnel (formulaire de contact)
Activer la réception des messages du formulaire dans Gmail.

**Service** : Resend.com (gratuit : 3 000 emails/mois)

**Procédure :**
1. Créer un compte sur https://resend.com (avec rigi34000@gmail.com)
2. Aller dans API Keys → Create API Key → copier la clé
3. Dans le terminal :
```bash
cd /root/regis-copy
echo "RESEND_API_KEY=re_XXXXXXXX" > .env.local
```
4. Ajouter la variable sur Vercel :
```bash
vercel env add RESEND_API_KEY production
# Coller la clé quand demandé
```
5. Décommenter le code Resend dans `src/app/api/contact/route.ts`
6. `vercel --prod`

→ Chaque message du formulaire arrive dans ta boîte Gmail.

---

### Étape 3 — Personnalisation du contenu
Remplacer les textes génériques par ton vrai positionnement.

**Fichiers à modifier :**

| Quoi | Où |
|---|---|
| Titre hero ("Des mots qui vendent") | `src/app/page.tsx` ligne ~30 |
| Description services | `src/app/page.tsx` (tableau `services`) |
| Bio ("Je cours à 57 ans") | `src/app/page.tsx` section "Pourquoi moi" |
| Tarifs et délais | `src/app/services/page.tsx` (tableau `offres`) |
| Nom dans la nav | `src/app/layout.tsx` fonction `Nav()` |

**Ou simplement demander à Claude :**
> "Remplace le texte du hero par : [ton nouveau texte]"
> "Ajoute une section témoignages sur la page d'accueil"
> "Crée une page À propos avec [tes infos]"

---

## STACK TECHNIQUE

| | |
|---|---|
| **Framework** | Next.js 16 (App Router) |
| **Styles** | Tailwind CSS v4 |
| **Blog** | Fichiers Markdown (gray-matter) |
| **Emails** | Resend (à activer) |
| **Hébergement** | Vercel (gratuit) |
| **Language** | TypeScript |
| **Node** | v20.19.4 |

---

## COMMANDES ESSENTIELLES

```bash
npm run dev          # Démarrer en local → http://localhost:3000
npm run build        # Vérifier sans erreur avant déploiement
vercel --prod        # Mettre en ligne en production
vercel logs          # Voir les logs du dernier déploiement
vercel ls            # Lister les déploiements
```

---

*Guide complet : /root/regis-copy/GUIDE.md*
*Dernière mise à jour : 2026-05-11*
