<script lang="ts">
	import {
		Tooltip,
		TooltipTrigger,
		TooltipContent,
		TooltipProvider,
		Button
	} from '@sahil3vedi/bespoke-components';
	import { ArrowUpRight, Info, Settings, Bell, Save, Plus } from 'lucide-svelte';
</script>

<div class="grid">
	<h1>Tooltip</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		A popup that displays information related to an element when the element receives keyboard focus
		or the mouse hovers over it.
	</p>
	<div class="mb-6 flex flex-wrap items-center gap-4">
		<TooltipProvider>
			<Tooltip>
				<TooltipTrigger>
					{#snippet child({ props })}
						<Button {...props} variant="outline">Hover me</Button>
					{/snippet}
				</TooltipTrigger>
				<TooltipContent>
					<p>This is a tooltip</p>
				</TooltipContent>
			</Tooltip>
		</TooltipProvider>
	</div>

	<!-- On Icon Buttons -->
	<h2>On Icon Buttons</h2>
	<p class="mb-4 text-sm text-muted-foreground">Essential for icon-only buttons without labels.</p>
	<div class="mb-6 flex flex-wrap gap-4">
		<TooltipProvider>
			<Tooltip>
				<TooltipTrigger>
					{#snippet child({ props })}
						<Button {...props} size="icon" variant="outline" aria-label="Save">
							<Save class="size-4" />
						</Button>
					{/snippet}
				</TooltipTrigger>
				<TooltipContent>
					<p>Save changes</p>
				</TooltipContent>
			</Tooltip>

			<Tooltip>
				<TooltipTrigger>
					{#snippet child({ props })}
						<Button {...props} size="icon" variant="outline" aria-label="Settings">
							<Settings class="size-4" />
						</Button>
					{/snippet}
				</TooltipTrigger>
				<TooltipContent>
					<p>Settings</p>
				</TooltipContent>
			</Tooltip>

			<Tooltip>
				<TooltipTrigger>
					{#snippet child({ props })}
						<Button {...props} size="icon" variant="outline" aria-label="Notifications">
							<Bell class="size-4" />
						</Button>
					{/snippet}
				</TooltipTrigger>
				<TooltipContent>
					<p>Notifications</p>
				</TooltipContent>
			</Tooltip>
		</TooltipProvider>
	</div>

	<!-- Rich Content -->
	<h2>Rich Content</h2>
	<p class="mb-4 text-sm text-muted-foreground">Tooltips can contain more than just text.</p>
	<div class="mb-6 flex flex-wrap gap-4">
		<TooltipProvider>
			<Tooltip>
				<TooltipTrigger>
					{#snippet child({ props })}
						<Button {...props} variant="outline">
							<Info class="mr-2 size-4" />
							More info
						</Button>
					{/snippet}
				</TooltipTrigger>
				<TooltipContent class="max-w-xs">
					<div class="grid gap-1">
						<p class="font-medium">Keyboard Shortcuts</p>
						<div class="text-xs text-muted-foreground">
							<p>
								<kbd class="rounded border border-border px-1 text-xs">Ctrl</kbd> +
								<kbd class="rounded border border-border px-1 text-xs">S</kbd> Save
							</p>
							<p>
								<kbd class="rounded border border-border px-1 text-xs">Ctrl</kbd> +
								<kbd class="rounded border border-border px-1 text-xs">Z</kbd> Undo
							</p>
						</div>
					</div>
				</TooltipContent>
			</Tooltip>
		</TooltipProvider>
	</div>

	<!-- Truncated Text -->
	<h2>Truncated Text</h2>
	<p class="mb-4 text-sm text-muted-foreground">Show full content on hover for truncated text.</p>
	<div class="mb-6 max-w-xs">
		<TooltipProvider>
			<Tooltip>
				<TooltipTrigger class="w-full truncate text-left text-sm text-muted-foreground">
					This is a very long piece of text that will be truncated with an ellipsis when it
					overflows
				</TooltipTrigger>
				<TooltipContent class="max-w-xs">
					<p class="text-sm">
						This is a very long piece of text that will be truncated with an ellipsis when it
						overflows
					</p>
				</TooltipContent>
			</Tooltip>
		</TooltipProvider>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">
			Tooltips appear on hover and focus. Here's a toolbar with tooltips:
		</p>
		<div class="mt-4 flex items-center gap-2 rounded-lg border border-border bg-background p-2">
			<TooltipProvider>
				<Tooltip>
					<TooltipTrigger>
						{#snippet child({ props })}
							<Button {...props} size="icon-sm" variant="ghost" aria-label="Add new">
								<Plus class="size-4" />
							</Button>
						{/snippet}
					</TooltipTrigger>
					<TooltipContent>
						<p>Add new item</p>
					</TooltipContent>
				</Tooltip>

				<Tooltip>
					<TooltipTrigger>
						{#snippet child({ props })}
							<Button {...props} size="icon-sm" variant="ghost" aria-label="Save">
								<Save class="size-4" />
							</Button>
						{/snippet}
					</TooltipTrigger>
					<TooltipContent>
						<p>Save</p>
					</TooltipContent>
				</Tooltip>

				<Tooltip>
					<TooltipTrigger>
						{#snippet child({ props })}
							<Button {...props} size="icon-sm" variant="ghost" aria-label="Settings">
								<Settings class="size-4" />
							</Button>
						{/snippet}
					</TooltipTrigger>
					<TooltipContent>
						<p>Open settings</p>
					</TooltipContent>
				</Tooltip>

				<Tooltip>
					<TooltipTrigger>
						{#snippet child({ props })}
							<Button {...props} size="icon-sm" variant="ghost" aria-label="External link">
								<ArrowUpRight class="size-4" />
							</Button>
						{/snippet}
					</TooltipTrigger>
					<TooltipContent>
						<p>Open in new tab</p>
					</TooltipContent>
				</Tooltip>
			</TooltipProvider>
		</div>
		<div class="mt-4 text-sm text-muted-foreground">
			<ul class="mt-1 list-inside list-disc space-y-1">
				<li>Hover over any icon button to see its tooltip</li>
				<li>
					Use <kbd class="rounded border border-border px-1 text-xs">Tab</kbd> to focus and see tooltips
					via keyboard
				</li>
				<li>
					Wrap tooltips in <code class="rounded bg-background px-1 py-0.5 text-foreground"
						>TooltipProvider</code
					> for shared delay
				</li>
			</ul>
		</div>
	</div>
</div>
