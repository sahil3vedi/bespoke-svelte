# bespoke-boilerplate

A SvelteKit starter wired to the [`@sahil3vedi/bespoke-components`](https://www.npmjs.com/package/@sahil3vedi/bespoke-components) library, with Tailwind theming preconfigured. Scaffolded with [`sv`](https://github.com/sveltejs/cli) and used as the base for new apps.

## Creating a project

If you're seeing this, you've probably already done this step. Congrats!

```sh
# create a new project
npx sv create my-app
```

To recreate this project with the same configuration:

```sh
# recreate this project
pnpm dlx sv@0.15.1 create --template minimal --types ts --add prettier eslint vitest="usages:unit,component" playwright tailwindcss="plugins:typography,forms" sveltekit-adapter="adapter:node" mcp="ide:opencode" --install pnpm bespoke-boilerplate
```

## Component library

UI comes from [`@sahil3vedi/bespoke-components`](https://www.npmjs.com/package/@sahil3vedi/bespoke-components), declared as a normal npm dependency in `package.json`. The theme tokens are pulled in once via `src/routes/theme.css`:

```css
@import '@sahil3vedi/bespoke-components/theme.css';
```

### Local source vs published package

The boilerplate can resolve the library two ways, toggled by the `BESPOKE_SOURCE_ALIAS` env var:

| Command | `BESPOKE_SOURCE_ALIAS` | Library resolves from |
| --- | --- | --- |
| `pnpm dev` | `true` | local source at `../bespoke-components/src/lib` — **hot reload** while editing the library |
| `pnpm dev:dist` | `false` | the **published** npm package |
| `pnpm build` | _(unset)_ | the **published** npm package |

The alias is wired in `svelte.config.js` (key `@sahil3vedi/bespoke-components` → local `src/lib`) and `vite.config.ts` (`optimizeDeps.exclude`). Local-source mode requires the `bespoke-components` repo checked out as a sibling directory; it is a dev convenience only — production builds always use the published package.

To pick up a new published library version, bump the range in `package.json` and run `pnpm install`.

## Developing

Once you've installed dependencies with `pnpm install`, start a development server:

```sh
# local library source, hot reload
pnpm dev

# against the published package
pnpm dev:dist

# or open the app in a new browser tab
pnpm dev -- --open
```

## Building

To create a production version of your app:

```sh
npm run build
```

You can preview the production build with `npm run preview`.

> To deploy your app, you may need to install an [adapter](https://svelte.dev/docs/kit/adapters) for your target environment.
