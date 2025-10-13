👉 [0sw_projets_cours/c07_plateforme at master · nbourre/0sw_projets_cours · GitHub](https://github.com/nbourre/0sw_projets_cours/tree/master/c07_plateforme)

Clique sur le bouton **« Fork »** (en haut à droite du dépôt, pas du dossier).

➡️ GitHub va créer automatiquement :  
`https://github.com/MaiveCL/0sw_projets_cours`

> (Tu ne peux pas forker *un sous-dossier* comme `c07_plateforme`, mais bien tout le dépôt.)

---

### 2. Clone ton fork localement

Choisis où tu veux travailler, puis fais :

```bash
git clone https://github.com/MaiveCL/0sw_projets_cours.git
```

Tu auras le dossier complet contenant tous les projets du prof, dont `c07_plateforme`.

---

### 3. Entre dans le dossier du TP

`cd 0sw_projets_cours/c07_plateforme`

C’est ici que tu vas travailler ton TP (ajouter ton code, modifier, etc.)

---

### 4. (Optionnel mais utile) Garde le lien avec le dépôt du prof

Ajoute un *remote* vers le dépôt original du prof, pour pouvoir tirer ses mises à jour :

```bash
git remote add upstream https://github.com/nbourre/0sw_projets_cours.git
```

Tu peux vérifier :

```bash
git remote -v
```

Résultat :

`origin  https://github.com/MaiveCL/0sw_LabJeu3_fork.git (fetch)
origin  https://github.com/MaiveCL/0sw_LabJeu3_fork.git (push)
upstream        https://github.com/nbourre/0sw_projets_cours.git (fetch)
upstream        https://github.com/nbourre/0sw_projets_cours.git (push)`

| Remote     | URL                                                | Rôle                                                |
| ---------- | -------------------------------------------------- | --------------------------------------------------- |
| `origin`   | `https://github.com/MaiveCL/0sw_LabJeu3_fork.git`  | **Ton fork** → là où tu pousses tes modifications   |
| `upstream` | `https://github.com/nbourre/0sw_projets_cours.git` | **Dépôt du prof** → pour récupérer ses mises à jour |

---

### 5. Pousser tes changements sur ton fork

Quand tu as modifié quelque chose :

```bash
git add . 
git commit -m "Travail sur c07_plateforme" 
git push origin master
```

> Toujours sauvegarder ton travail actuel avant de fusionner.

## 1️⃣ Récupérer les nouveautés du prof (`upstream`)

Ton fork est une copie du dépôt du prof, mais après ton fork le dépôt du prof peut évoluer. Pour **mettre ton fork à jour sans perdre ton travail**, on utilise `upstream`.

---

`git fetch upstream`

**Ce que ça fait :**

- Va sur GitHub et **télécharge les nouvelles branches et commits du dépôt du prof** (`upstream`) **sans les fusionner** avec ton code local.

- Ton code local et ton fork (`origin`) restent inchangés.

- Git garde ces commits du prof dans une branche spéciale `upstream/main`.

✅ Très sûr : rien n’est modifié dans ton code local.

---

`git merge upstream/main`⚠️ Important : fais toujours un `git status` et `git add/commit` **avant** de merger, pour ne pas perdre de travail.

**Ce que ça fait :**

- Fusionne les changements récupérés du dépôt du prof (`upstream/main`) dans **ta branche locale actuelle** (souvent `main`).

- Si ton code local et les commits du prof n’entrent pas en conflit, la fusion se fait automatiquement.

- Si un conflit apparaît pendant le merge :
  
  - Git marque les fichiers conflictuels.
  
  - Ouvre-les et choisis quelles parties garder.

- Ensuite :

`git add <fichier_conflit> 
git commit -m "Résolution du conflit"`

---

Vérifie toujours les branches et les remotes :

```bash
git branch # quelles branches locales ?
git remote -v # origin = ton fork, upstream = dépôt prof
```

---

Quand tu as fini ton TP et que tout fonctionne, pousse sur **origin** :

`git push origin main`

> Ne jamais pousser directement sur `upstream` : tu n’as pas les droits, et ça évite d’écraser le dépôt du prof.

---

### 6. (Facultatif) Si ton prof veut un *Pull Request*

Tu pourras aller sur GitHub → ton dépôt `MaiveCL/0sw_projets_cours`  
et cliquer sur **“Compare & pull request”** pour proposer tes changements au dépôt du prof.


