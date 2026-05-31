<script lang="ts">
	import { Input, Label } from '@sahil3vedi/bespoke-components';
	import { Search, Mail } from '@lucide/svelte';

	let name = $state('');
	let email = $state('');
	let searchQuery = $state('');
</script>

<div class="grid">
	<h1>Input</h1>

	<!-- Types -->
	<h2>Types</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Standard HTML input types: text, email, password, number.
	</p>
	<div class="mb-6 grid max-w-sm gap-4">
		<Input type="text" placeholder="Text input" />
		<Input type="email" placeholder="Email" />
		<Input type="password" placeholder="Password" />
		<Input type="number" placeholder="Number" />
	</div>

	<!-- Disabled -->
	<h2>Disabled</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Set <code>disabled</code> to prevent interaction.
	</p>
	<div class="mb-6 max-w-sm">
		<Input disabled placeholder="Disabled input" />
	</div>

	<!-- With Label -->
	<h2>With Label</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Pair with <code>Label</code> for accessible forms.
	</p>
	<div class="mb-6 grid max-w-sm gap-2">
		<Label for="p1-name">Name</Label>
		<Input id="p1-name" placeholder="Enter your name" />
	</div>

	<!-- With Icon -->
	<h2>With Icon</h2>
	<p class="mb-4 text-sm text-muted-foreground">Combine with Lucide icons using a wrapper.</p>
	<div class="mb-6 grid max-w-sm gap-4">
		<div class="relative">
			<Search class="absolute top-1/2 left-3 size-4 -translate-y-1/2 text-muted-foreground" />
			<Input class="pl-9" placeholder="Search..." />
		</div>
		<div class="relative">
			<Mail class="absolute top-1/2 left-3 size-4 -translate-y-1/2 text-muted-foreground" />
			<Input class="pl-9" type="email" placeholder="Email" />
		</div>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">
			Bind to <code>value</code> with <code>$state</code>:
		</p>
		<div class="grid max-w-sm gap-4">
			<div class="grid gap-2">
				<Label for="p1-ie-name">Name</Label>
				<Input id="p1-ie-name" bind:value={name} placeholder="Your name" />
			</div>
			<div class="grid gap-2">
				<Label for="p1-ie-email">Email</Label>
				<Input id="p1-ie-email" type="email" bind:value={email} placeholder="you@example.com" />
			</div>
			<div class="relative">
				<Search class="absolute top-1/2 left-3 size-4 -translate-y-1/2 text-muted-foreground" />
				<Input class="pl-9" bind:value={searchQuery} placeholder="Search..." />
			</div>
			<div class="mt-2 space-y-1 text-sm text-muted-foreground">
				<p>Name: <code class="rounded bg-background px-1 py-0.5">{name || '—'}</code></p>
				<p>Email: <code class="rounded bg-background px-1 py-0.5">{email || '—'}</code></p>
				<p>Search: <code class="rounded bg-background px-1 py-0.5">{searchQuery || '—'}</code></p>
			</div>
		</div>
	</div>
</div>
