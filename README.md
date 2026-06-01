# Bespoke

A Svelte 5 design system and the tooling to build apps with it. Three pieces live in this repo:

| Directory / file | What it is |
| --- | --- |
| `bespoke-components/` | The published component library — `@sahil3vedi/bespoke-components`. |
| `create-bespoke-app.sh` | A CLI script that scaffolds a new SvelteKit app wired to the library. |
| `bespoke-boilerplate/` | A reference starter app showing the library wired up end to end. |

## `create-bespoke-app.sh` — the CLI

A bash script that scaffolds a fresh SvelteKit project pre-wired to the component library: Svelte 5, Tailwind v4 (configured to scan the library's compiled files via `@source`), the theme tokens, and a `BespokeLayout` sidebar/navbar shell with empty routes ready to fill in.

```sh
./create-bespoke-app.sh <app-name>
cd <app-name>
pnpm dev
```

It runs `sv create` (minimal + TypeScript, with prettier, eslint, vitest, playwright, tailwind, and the node adapter), installs `@sahil3vedi/bespoke-components` and `@lucide/svelte`, then writes the Tailwind/theme entry, the layout shell, and a starter home route.

## `bespoke-components/` — the component library

`@sahil3vedi/bespoke-components` — a Svelte 5 component library built on [Bits UI](https://bits-ui.com) and [Tailwind CSS](https://tailwindcss.com), with light/dark theming out of the box.

- **Svelte 5 native** — runes (`$state`, `$props`, `$bindable`) and snippets, no legacy stores or slots.
- **Accessible** — WAI-ARIA patterns via Bits UI primitives.
- **Themeable** — Tailwind v4 design tokens; light and dark modes included.
- **Composable** — small primitives composed into larger UI, customisable via the `class` prop on any part.

Components include `Button`, `Card`, `Input`, `Textarea`, `Label`, `Checkbox`, `Select`, `Combobox`, `DropdownMenu`, `Accordion`, `Table`, `DataTable`, `Navbar`, `Sidebar`, `PageContainer`, `BespokeLayout`, and `Loader`.

```sh
npm install @sahil3vedi/bespoke-components
```

```css
/* import the theme tokens once, e.g. in your root layout */
@import '@sahil3vedi/bespoke-components/theme.css';
```

```svelte
<script>
	import { Button, Card, CardHeader, CardTitle } from '@sahil3vedi/bespoke-components';
</script>

<Card>
	<CardHeader>
		<CardTitle>Hello</CardTitle>
	</CardHeader>
</Card>

<Button onclick={() => alert('clicked')}>Click me</Button>
```

Source repo: [github.com/sahil3vedi/bespoke-svelte](https://github.com/sahil3vedi/bespoke-svelte). See `bespoke-components/README.md` for full setup and usage.

## `bespoke-boilerplate/` — the starter app

A SvelteKit starter wired to the library with Tailwind theming preconfigured. Used as the reference base for new apps and to develop the library against a real app.

It can resolve the library two ways, toggled by the `BESPOKE_SOURCE_ALIAS` env var:

| Command | Library resolves from |
| --- | --- |
| `pnpm dev` | local source at `../bespoke-components/src/lib` — hot reload while editing the library |
| `pnpm dev:dist` | the published npm package |
| `pnpm build` | the published npm package |

Local-source mode requires `bespoke-components/` checked out as a sibling directory; it's a dev convenience only — production builds always use the published package.
