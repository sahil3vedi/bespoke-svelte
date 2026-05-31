<script lang="ts">
	import { Alert, AlertTitle, AlertDescription, AlertAction, Button } from 'bespoke-components';
	import { Info, AlertTriangle, X, Rocket, Lightbulb, FileWarning, Share2 } from 'lucide-svelte';

	let dismissed = $state(false);
</script>

<div class="grid">
	<h1>Alert</h1>

	<!-- Basic -->
	<h2>Default</h2>
	<p class="mb-4 text-sm text-muted-foreground">Alerts convey important information to the user.</p>
	<div class="mb-6 space-y-3">
		<Alert>
			<Info class="size-4" />
			<AlertTitle>Heads up!</AlertTitle>
			<AlertDescription>
				You can add components and dependencies to your app using the CLI.
			</AlertDescription>
		</Alert>
	</div>

	<!-- Variants -->
	<h2>Variants</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Use <code>variant</code> for different semantic styles.
	</p>
	<div class="mb-6 space-y-3">
		<Alert>
			<Rocket class="size-4" />
			<AlertTitle>Default Alert</AlertTitle>
			<AlertDescription>A standard informational message.</AlertDescription>
		</Alert>

		<Alert variant="destructive">
			<AlertTriangle class="size-4" />
			<AlertTitle>Destructive Alert</AlertTitle>
			<AlertDescription>Something went wrong! Check your input.</AlertDescription>
		</Alert>
	</div>

	<!-- With Action -->
	<h2>With Action</h2>
	<p class="mb-4 text-sm text-muted-foreground">Add buttons inside alerts for user actions.</p>
	<div class="mb-6 space-y-3">
		<Alert>
			<Lightbulb class="size-4" />
			<AlertTitle>Tip: Keyboard Shortcuts</AlertTitle>
			<AlertDescription>
				Press <kbd class="rounded border bg-muted px-1 py-0.5 text-xs">⌘K</kbd> to open the command palette.
			</AlertDescription>
			<AlertAction>
				<Button variant="outline" size="sm">Dismiss</Button>
			</AlertAction>
		</Alert>

		<Alert variant="destructive">
			<FileWarning class="size-4" />
			<AlertTitle>Confirm Deletion</AlertTitle>
			<AlertDescription>This action cannot be undone. 3 files will be deleted.</AlertDescription>
			<AlertAction class="flex flex-col gap-2 sm:flex-row">
				<Button variant="outline" size="sm" class="bg-background dark:bg-background">Cancel</Button>
				<Button variant="destructive" size="sm">Delete</Button>
			</AlertAction>
		</Alert>
	</div>

	<!-- Dismissible -->
	<h2>Dismissible</h2>
	<p class="mb-4 text-sm text-muted-foreground">Control visibility with Svelte 5 state.</p>
	<div class="mb-6">
		{#if !dismissed}
			<Alert>
				<Share2 class="size-4" />
				<AlertTitle>New feature available!</AlertTitle>
				<AlertDescription
					>Try the new dashboard layout — export reports in one click.</AlertDescription
				>
				<AlertAction>
					<Button
						variant="ghost"
						size="icon"
						onclick={() => (dismissed = true)}
						aria-label="Dismiss"
					>
						<X class="size-4" />
					</Button>
				</AlertAction>
			</Alert>
		{:else}
			<Alert>
				<Info class="size-4" />
				<AlertDescription>Alert dismissed. Refresh page to reset.</AlertDescription>
			</Alert>
		{/if}
	</div>

	<!-- Without Icon -->
	<h2>Without Icon</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Alerts work without an icon — just title + description.
	</p>
	<div class="mb-6 space-y-3">
		<Alert>
			<AlertTitle>Plain Alert</AlertTitle>
			<AlertDescription>This alert has no icon, just text content.</AlertDescription>
		</Alert>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">
			Import <code>alertVariants</code> for building custom alert-like elements:
		</p>
		<div class="mt-4">
			<div class="grid gap-0.5 rounded-lg border px-2.5 py-2 text-left text-sm">
				<div class="font-medium">Custom Element</div>
				<div class="text-sm text-balance text-muted-foreground">
					Use <code>cn(alertVariants(&#123; variant: 'destructive' &#125;))</code> for any element that
					should look like an alert.
				</div>
			</div>
		</div>
	</div>
</div>
