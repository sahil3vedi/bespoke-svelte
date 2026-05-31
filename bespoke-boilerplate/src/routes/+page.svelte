<script lang="ts">
	import {
		Card,
		CardHeader,
		CardTitle,
		CardDescription,
		Badge,
		Button
	} from 'bespoke-components';

	const components = [
		{ label: 'Button', path: '/button' },
		{ label: 'Dropdown Menu', path: '/dropdown-menu' },
		{ label: 'Select', path: '/select' },
		{ label: 'Combobox', path: '/combobox' },
		{ label: 'Table', path: '/table' },
		{ label: 'DataTable', path: '/data-table' },
		{ label: 'Accordion', path: '/accordion' },
		{ label: 'Input', path: '/input' },
		{ label: 'Textarea', path: '/textarea' },
		{ label: 'Label', path: '/label' },
		{ label: 'Checkbox', path: '/checkbox' },
		{ label: 'Switch', path: '/switch' },
		{ label: 'Dialog', path: '/dialog' },
		{ label: 'Popover', path: '/popover' },
		{ label: 'Tooltip', path: '/tooltip' },
		{ label: 'Card', path: '/card' },
		{ label: 'Badge', path: '/badge' },
		{ label: 'Skeleton', path: '/skeleton' },
		{ label: 'Tabs', path: '/tabs' },
		{ label: 'Alert', path: '/alert' },
		{ label: 'Sonner', path: '/sonner' }
	];

	const features = [
		{
			title: 'Svelte 5 native',
			body: 'Built on runes ($state, $props, $bindable) and snippets — no legacy stores or slots.'
		},
		{
			title: 'Accessible by default',
			body: 'Powered by Bits UI and WAI-ARIA patterns for keyboard navigation and screen readers.'
		},
		{
			title: 'Tailwind theming',
			body: 'Styled with Tailwind v4 design tokens. Light and dark modes work out of the box.'
		},
		{
			title: 'Composable',
			body: 'Small primitives you compose into larger UI, customisable via the class prop on any part.'
		}
	];
</script>

<div class="grid">
	<div class="mb-2 flex flex-wrap items-center gap-3">
		<h1 class="mb-0">Bespoke Components</h1>
		<Badge variant="secondary">v0.0.1</Badge>
	</div>
	<p class="mb-6 max-w-2xl text-muted-foreground">
		A Svelte 5 component library for building application UIs. {components.length} accessible, themeable
		components styled with Tailwind CSS. Pick a component from the sidebar to see live examples, variants,
		and usage notes.
	</p>

	<!-- Quick start -->
	<h2>Quick start</h2>
	<p class="mb-3 text-sm text-muted-foreground">Import components by name from the package:</p>
	<pre
		class="mb-6 max-w-2xl overflow-x-auto rounded-lg border border-border bg-muted p-4 text-sm"><code
			>import &#123; Button, Card, Badge &#125; from 'bespoke-components';</code
		></pre>

	<!-- Features -->
	<h2>Why Bespoke</h2>
	<div class="mb-8 grid gap-4 sm:grid-cols-2">
		{#each features as feature (feature.title)}
			<Card>
				<CardHeader>
					<CardTitle>{feature.title}</CardTitle>
					<CardDescription>{feature.body}</CardDescription>
				</CardHeader>
			</Card>
		{/each}
	</div>

	<!-- Component index -->
	<h2>Components</h2>
	<p class="mb-3 text-sm text-muted-foreground">Browse all {components.length} components:</p>
	<div class="mb-6 flex flex-wrap gap-2">
		{#each components as component (component.path)}
			<Button href={component.path} variant="outline" size="sm">{component.label}</Button>
		{/each}
	</div>
</div>
