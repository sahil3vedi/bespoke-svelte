# @sahil3vedi/bespoke-components

A Svelte 5 component library built on [Bits UI](https://bits-ui.com) and [Tailwind CSS](https://tailwindcss.com), with light/dark theming out of the box.

- **Svelte 5 native** — runes (`$state`, `$props`, `$bindable`) and snippets, no legacy stores or slots.
- **Accessible** — WAI-ARIA patterns via Bits UI primitives.
- **Themeable** — Tailwind v4 design tokens; light and dark modes included.
- **Composable** — small primitives you compose into larger UI, customisable via the `class` prop on any part.

## Installation

```sh
npm install @sahil3vedi/bespoke-components
```

### Peer requirements

This package expects the consuming app to provide:

- `svelte` `^5`
- `@sveltejs/kit` `^2`
- `tailwindcss` `^4` (components are styled with Tailwind utility classes)

## Setup

Import the theme stylesheet once (e.g. in your root layout or `app.css`):

```css
@import '@sahil3vedi/bespoke-components/theme.css';
```

This defines the design tokens (colors, radius, etc.) used by every component, including dark mode.

## Usage

```svelte
<script>
	import { Button, Card, CardHeader, CardTitle, Badge } from '@sahil3vedi/bespoke-components';
</script>

<Card>
	<CardHeader>
		<CardTitle>Hello</CardTitle>
		<Badge variant="secondary">v1</Badge>
	</CardHeader>
</Card>

<Button onclick={() => alert('clicked')}>Click me</Button>
```

## Components

Button, Dropdown Menu, Select, Combobox, Table, DataTable, Accordion, Input, Textarea, Label, Checkbox, Switch, Dialog, Popover, Tooltip, Card, Badge, Skeleton, Tabs, Alert, Sonner — plus layout primitives (BespokeLayout, Navbar, Sidebar, PageContainer, Loader).

## License

[MIT](./LICENSE) © Sahil Trivedi
