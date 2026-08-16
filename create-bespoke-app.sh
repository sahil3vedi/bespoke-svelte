#!/usr/bin/env bash
#
# Scaffold a new SvelteKit app wired to @sahil3vedi/bespoke-components:
# Svelte 5, Tailwind (with the library scanned via @source), theme tokens,
# and the BespokeLayout sidebar/navbar shell — with empty routes.
#
# Usage: ./create-bespoke-app.sh <app-name>

set -euo pipefail

APP_NAME="${1:-}"
if [[ -z "$APP_NAME" ]]; then
	echo "Usage: $0 <app-name>" >&2
	exit 1
fi
if [[ -e "$APP_NAME" ]]; then
	echo "Error: '$APP_NAME' already exists." >&2
	exit 1
fi

LIB="@sahil3vedi/bespoke-components"

echo "==> Scaffolding SvelteKit project '$APP_NAME'..."
pnpm dlx sv@0.15.1 create \
	--template minimal \
	--types ts \
	--add prettier eslint vitest="usages:unit,component" playwright tailwindcss="plugins:typography,forms" sveltekit-adapter="adapter:node" \
	--install pnpm \
	"$APP_NAME"

cd "$APP_NAME"

echo "==> Installing $LIB and icons..."
pnpm add "$LIB" @lucide/svelte

# The tailwindcss adder drops an app.css imported by +layout.svelte; we replace
# that wiring with our own layout.css/theme.css, so remove the stray entry.
rm -f src/app.css

echo "==> Writing Tailwind + theme entry..."
# Tailwind v4 must scan the library's compiled .svelte files in node_modules,
# otherwise the utility classes the components rely on are never generated.
cat > src/routes/layout.css <<'CSS'
@import 'tailwindcss';
@plugin '@tailwindcss/forms';
@plugin '@tailwindcss/typography';
@custom-variant dark (&:where(.dark, .dark *));
@source '../../node_modules/@sahil3vedi/bespoke-components/dist';
@import './theme.css';
CSS

cat > src/routes/theme.css <<'CSS'
@import '@sahil3vedi/bespoke-components/theme.css';
CSS

echo "==> Writing layout shell + empty home route..."
cat > src/routes/+layout.svelte <<'SVELTE'
<script lang="ts">
	import './layout.css';
	import { BespokeLayout, type SidebarItem } from '@sahil3vedi/bespoke-components';
	import { House } from '@lucide/svelte';

	let { children } = $props();

	const sidebarItems: SidebarItem[] = [{ label: 'Home', icon: House, path: '/' }];
</script>

<BespokeLayout title="App" {sidebarItems}>
	{@render children()}
</BespokeLayout>
SVELTE

cat > src/routes/+page.svelte <<'SVELTE'
<div class="grid">
	<h1>Home</h1>
	<p class="text-muted-foreground">Start building.</p>
</div>
SVELTE

echo ""
echo "==> Done. Next steps:"
echo "    cd $APP_NAME"
echo "    pnpm dev"
