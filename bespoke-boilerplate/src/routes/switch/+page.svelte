<script lang="ts">
	import { Switch, Label } from '@sahil3vedi/bespoke-components';

	let airplaneMode = $state(false);
	let darkMode = $state(true);
	let notifications = $state(false);
	let marketing = $state(false);
</script>

<div class="grid">
	<h1>Switch</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		A control that allows the user to toggle between on and off states.
	</p>
	<div class="mb-6 flex items-center gap-2">
		<Switch id="p1-airplane" />
		<Label for="p1-airplane">Airplane mode</Label>
	</div>

	<!-- Checked / Unchecked -->
	<h2>Checked / Unchecked</h2>
	<div class="mb-6 flex flex-wrap gap-6">
		<div class="flex items-center gap-2">
			<Switch id="p1-sw-off" />
			<Label for="p1-sw-off">Off</Label>
		</div>
		<div class="flex items-center gap-2">
			<Switch id="p1-sw-on" checked />
			<Label for="p1-sw-on">On</Label>
		</div>
	</div>

	<!-- Disabled -->
	<h2>Disabled</h2>
	<div class="mb-6 flex flex-wrap gap-6">
		<div class="flex items-center gap-2">
			<Switch id="p1-sw-dis-off" disabled />
			<Label for="p1-sw-dis-off">Disabled off</Label>
		</div>
		<div class="flex items-center gap-2">
			<Switch id="p1-sw-dis-on" disabled checked />
			<Label for="p1-sw-dis-on">Disabled on</Label>
		</div>
	</div>

	<!-- Settings list -->
	<h2>Settings Panel</h2>
	<p class="mb-4 text-sm text-muted-foreground">Common pattern for settings toggles.</p>
	<div class="mb-6 max-w-sm space-y-4 rounded-lg border border-border p-4">
		<div class="flex items-center justify-between">
			<div>
				<Label for="p1-set-dark" class="text-sm font-medium">Dark mode</Label>
				<p class="text-xs text-muted-foreground">Enable dark theme</p>
			</div>
			<Switch id="p1-set-dark" bind:checked={darkMode} />
		</div>
		<div class="flex items-center justify-between">
			<div>
				<Label for="p1-set-notif" class="text-sm font-medium">Notifications</Label>
				<p class="text-xs text-muted-foreground">Receive push notifications</p>
			</div>
			<Switch id="p1-set-notif" bind:checked={notifications} />
		</div>
		<div class="flex items-center justify-between">
			<div>
				<Label for="p1-set-market" class="text-sm font-medium">Marketing emails</Label>
				<p class="text-xs text-muted-foreground">Receive product updates</p>
			</div>
			<Switch id="p1-set-market" bind:checked={marketing} />
		</div>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">
			Bind to <code>checked</code> with <code>$state</code>:
		</p>
		<div class="flex items-center gap-3">
			<Switch id="p1-ie-airplane" bind:checked={airplaneMode} />
			<Label for="p1-ie-airplane">
				Airplane mode
				{#if airplaneMode}
					<span class="ml-1 inline-block h-2 w-2 animate-pulse rounded-full bg-orange-500"></span>
				{:else}
					<span class="ml-1 inline-block h-2 w-2 rounded-full bg-green-500"></span>
				{/if}
			</Label>
		</div>
		<div class="mt-4 text-sm text-muted-foreground">
			<p>
				Current settings:
				<span class="ml-2 space-x-2">
					<code class="rounded bg-background px-1 py-0.5">Dark: {darkMode}</code>
					<code class="rounded bg-background px-1 py-0.5">Notif: {notifications}</code>
					<code class="rounded bg-background px-1 py-0.5">Marketing: {marketing}</code>
				</span>
			</p>
		</div>
	</div>
</div>
