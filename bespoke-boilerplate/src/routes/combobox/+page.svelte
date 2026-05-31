<script>
	import {
		Combobox,
		ComboboxTrigger,
		ComboboxContent,
		ComboboxItem,
		ComboboxEmpty
	} from '@sahil3vedi/bespoke-components';

	const frameworks = [
		{ value: 'next.js', label: 'Next.js' },
		{ value: 'sveltekit', label: 'SvelteKit' },
		{ value: 'nuxt.js', label: 'Nuxt.js' },
		{ value: 'remix', label: 'Remix' },
		{ value: 'astro', label: 'Astro' }
	];

	const timezones = [
		{ value: 'est', label: 'Eastern Standard Time (EST)' },
		{ value: 'cst', label: 'Central Standard Time (CST)' },
		{ value: 'mst', label: 'Mountain Standard Time (MST)' },
		{ value: 'pst', label: 'Pacific Standard Time (PST)' },
		{ value: 'gmt', label: 'Greenwich Mean Time (GMT)' },
		{ value: 'cet', label: 'Central European Time (CET)' },
		{ value: 'ist', label: 'India Standard Time (IST)' },
		{ value: 'jst', label: 'Japan Standard Time (JST)' }
	];

	let framework = $state('');
	let timezone = $state('');
	let language = $state('');
	let selectedTech = $state(/** @type {string[]} */ ([]));
</script>

<div class="grid">
	<h1>Combobox</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<div class="mb-6 w-56">
		<Combobox bind:value={framework}>
			<ComboboxTrigger placeholder="Select framework..." />
			<ComboboxContent placeholder="Search framework...">
				{#each frameworks as f (f.value)}
					<ComboboxItem value={f.value} label={f.label}>{f.label}</ComboboxItem>
				{/each}
				<ComboboxEmpty />
			</ComboboxContent>
		</Combobox>
	</div>

	<!-- Longer List -->
	<h2>Longer List with Search</h2>
	<div class="mb-6 w-64">
		<Combobox bind:value={timezone}>
			<ComboboxTrigger placeholder="Select timezone..." />
			<ComboboxContent placeholder="Search timezone...">
				{#each timezones as tz (tz.value)}
					<ComboboxItem value={tz.value} label={tz.label}>{tz.label}</ComboboxItem>
				{/each}
				<ComboboxEmpty />
			</ComboboxContent>
		</Combobox>
	</div>

	<!-- Custom Empty Message -->
	<h2>Custom Empty Message</h2>
	<div class="mb-6 w-56">
		<Combobox>
			<ComboboxTrigger placeholder="Select language..." />
			<ComboboxContent placeholder="Search...">
				<ComboboxItem value="typescript" label="TypeScript">TypeScript</ComboboxItem>
				<ComboboxItem value="javascript" label="JavaScript">JavaScript</ComboboxItem>
				<ComboboxItem value="rust" label="Rust">Rust</ComboboxItem>
				<ComboboxItem value="go" label="Go">Go</ComboboxItem>
				<ComboboxItem value="python" label="Python">Python</ComboboxItem>
				<ComboboxEmpty>No language found. Try a different search.</ComboboxEmpty>
			</ComboboxContent>
		</Combobox>
	</div>

	<!-- Multiple Select -->
	<h2>Multiple Select</h2>
	<div class="mb-6 w-72">
		<Combobox multiple bind:value={selectedTech}>
			<ComboboxTrigger placeholder="Select technologies..." />
			<ComboboxContent placeholder="Search...">
				<ComboboxItem value="typescript" label="TypeScript">TypeScript</ComboboxItem>
				<ComboboxItem value="javascript" label="JavaScript">JavaScript</ComboboxItem>
				<ComboboxItem value="svelte" label="Svelte">Svelte</ComboboxItem>
				<ComboboxItem value="react" label="React">React</ComboboxItem>
				<ComboboxItem value="vue" label="Vue">Vue</ComboboxItem>
				<ComboboxItem value="rust" label="Rust">Rust</ComboboxItem>
				<ComboboxItem value="go" label="Go">Go</ComboboxItem>
				<ComboboxEmpty />
			</ComboboxContent>
		</Combobox>
		{#if selectedTech.length > 0}
			<p class="mt-2 text-sm text-muted-foreground">
				Selected: <strong class="text-foreground">{selectedTech.join(', ')}</strong>
			</p>
		{/if}
	</div>

	<!-- Disabled -->
	<h2>Disabled</h2>
	<div class="mb-6 w-56">
		<Combobox disabled>
			<ComboboxTrigger placeholder="Cannot select..." />
			<ComboboxContent>
				<ComboboxItem value="a" label="Option A">Option A</ComboboxItem>
			</ComboboxContent>
		</Combobox>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">
			Type to filter the list. Selecting an item closes the popover and shows a checkmark on
			re-open.
		</p>
		<div class="flex flex-wrap items-center gap-4">
			<div class="w-56">
				<Combobox bind:value={language}>
					<ComboboxTrigger placeholder="Select language..." />
					<ComboboxContent placeholder="Search language...">
						<ComboboxItem value="typescript" label="TypeScript">TypeScript</ComboboxItem>
						<ComboboxItem value="javascript" label="JavaScript">JavaScript</ComboboxItem>
						<ComboboxItem value="rust" label="Rust">Rust</ComboboxItem>
						<ComboboxItem value="go" label="Go">Go</ComboboxItem>
						<ComboboxItem value="python" label="Python">Python</ComboboxItem>
						<ComboboxItem value="java" label="Java">Java</ComboboxItem>
						<ComboboxItem value="csharp" label="C#">C#</ComboboxItem>
						<ComboboxItem value="cpp" label="C++">C++</ComboboxItem>
						<ComboboxEmpty />
					</ComboboxContent>
				</Combobox>
			</div>
			<div class="text-sm text-muted-foreground">
				{#if language}
					<span class="flex items-center gap-2">
						<span class="inline-block h-2 w-2 rounded-full bg-green-500"></span>
						Selected: <strong class="text-foreground">{language}</strong>
					</span>
				{:else}
					No language selected
				{/if}
			</div>
		</div>
		<div class="mt-4 text-sm text-muted-foreground">
			<p>The Combobox component:</p>
			<ul class="mt-1 list-inside list-disc space-y-1">
				<li>Filters items as you type</li>
				<li>Shows a checkmark next to the selected item on re-open</li>
				<li>
					Closes on outside click or <code class="rounded bg-background px-1 py-0.5 text-foreground"
						>Escape</code
					>
				</li>
				<li>Auto-focuses the search input when opened</li>
				<li>Shows a custom empty state when no items match</li>
			</ul>
		</div>
	</div>
</div>
