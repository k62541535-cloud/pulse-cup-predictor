# Champions League Foari

A UEFA Champions League 2025/26 prediction site with:

- knockout-round fixtures linked to official UEFA pages
- Google sign-in
- a shared multiplayer leaderboard
- local PowerShell hosting for Windows
- a Render-ready Node deployment with its own new service name

Official UEFA sources used in this version:

- Fixtures and results: `https://www.uefa.com/uefachampionsleague/news/029c-1e9a2f63fe2d-ebf9ad643892-1000/`
- Semi-final lineup: `https://www.uefa.com/uefachampionsleague/news/029c-1ea2493b1fbb-44d8419369bb-1000/`
- 2026 final in Budapest: `https://www.uefa.com/uefachampionsleague/news/0293-1c88ad8f4243-4e979f28f98f-1000/`

## Run locally

```powershell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File .\server.ps1 -Port 8080
```

Then open `http://localhost:8080`.

## Google sign-in

Create `.env` in the project root:

```env
GOOGLE_CLIENT_ID=your-google-oauth-client-id.apps.googleusercontent.com
```

Authorized JavaScript origins:

- `http://localhost:8080`
- your final hosted origin, for example `https://champions-league-foari.onrender.com`

## Deploy to Render

This folder is meant to deploy as a separate service with a new link.

`render.yaml` now uses:

- service name: `champions-league-foari`

That means the hosted URL should be similar to:

- `https://champions-league-foari.onrender.com`

In Render, add:

- `GOOGLE_CLIENT_ID`
- `SESSION_SECRET`
- `PUBLIC_BASE_URL`

Set:

```env
PUBLIC_BASE_URL=https://champions-league-foari.onrender.com
```

Then add that same exact origin in Google Cloud.

## Important note

`data/predictions.json` is still file-backed, so free Render restarts or redeploys can reset the leaderboard unless you move it to a database later.
