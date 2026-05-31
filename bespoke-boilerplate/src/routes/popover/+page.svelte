<script lang="ts">
	import {
		Popover,
		PopoverTrigger,
		PopoverContent,
		PopoverHeader,
		PopoverTitle,
		PopoverDescription,
		PopoverClose,
		Button,
		Checkbox,
		Input,
		Label
	} from '@sahil3vedi/bespoke-components';
	import { Settings, Bell, Share2, Info } from '@lucide/svelte';

	let open = $state(false);
</script>

<div class="grid">
	<h1>Popover</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Displays rich content in a portal triggered by a button.
	</p>
	<div class="mb-6">
		<Popover>
			<PopoverTrigger>
				<Button variant="outline">
					<Info class="mr-2 size-4" />
					Open Popover
				</Button>
			</PopoverTrigger>
			<PopoverContent class="w-80">
				<div class="grid gap-4">
					<div class="space-y-2">
						<h4 class="leading-none font-medium">About Popovers</h4>
						<p class="text-sm text-muted-foreground">
							Popovers are perfect for displaying contextual information, settings, or actions.
						</p>
					</div>
				</div>
			</PopoverContent>
		</Popover>
	</div>

	<!-- With Title & Description -->
	<h2>With Header</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Use <code>PopoverHeader</code> for structured content.
	</p>
	<div class="mb-6">
		<Popover>
			<PopoverTrigger>
				<Button variant="outline">
					<Settings class="mr-2 size-4" />
					Settings
				</Button>
			</PopoverTrigger>
			<PopoverContent>
				<PopoverHeader>
					<PopoverTitle>Notification Settings</PopoverTitle>
					<PopoverDescription>Choose what notifications you want to receive.</PopoverDescription>
				</PopoverHeader>
				<div class="grid gap-2">
					<div class="flex items-center gap-2">
						<Checkbox id="pop-email" checked />
						<Label for="pop-email">Email notifications</Label>
					</div>
					<div class="flex items-center gap-2">
						<Checkbox id="pop-push" />
						<Label for="pop-push">Push notifications</Label>
					</div>
				</div>
			</PopoverContent>
		</Popover>
	</div>

	<!-- With Action Buttons -->
	<h2>With Actions</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Popovers can contain interactive elements like buttons and inputs.
	</p>
	<div class="mb-6">
		<Popover>
			<PopoverTrigger>
				<Button variant="outline">
					<Share2 class="mr-2 size-4" />
					Share
				</Button>
			</PopoverTrigger>
			<PopoverContent class="w-80">
				<div class="grid gap-4">
					<div class="space-y-2">
						<h4 class="leading-none font-medium">Share this page</h4>
						<p class="text-sm text-muted-foreground">Anyone with the link can view.</p>
					</div>
					<div class="flex gap-2">
						<Input value="https://example.com/share/abc123" readonly class="flex-1 text-xs" />
						<Button size="sm">Copy</Button>
					</div>
				</div>
			</PopoverContent>
		</Popover>
	</div>

	<!-- With Close Button -->
	<h2>With Close Button</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Add <code>PopoverClose</code> for an explicit close control.
	</p>
	<div class="mb-6">
		<Popover>
			<PopoverTrigger>
				<Button variant="outline">
					<Bell class="mr-2 size-4" />
					Notifications
				</Button>
			</PopoverTrigger>
			<PopoverContent class="w-72">
				<PopoverHeader>
					<PopoverTitle>Notifications</PopoverTitle>
				</PopoverHeader>
				<div class="grid gap-2">
					<div class="rounded-md bg-muted p-3">
						<p class="text-sm font-medium">New feature released</p>
						<p class="text-xs text-muted-foreground">2 hours ago</p>
					</div>
					<div class="rounded-md bg-muted p-3">
						<p class="text-sm font-medium">Your report is ready</p>
						<p class="text-xs text-muted-foreground">Yesterday</p>
					</div>
				</div>
				<div class="mt-2">
					<PopoverClose
						><Button variant="outline" size="sm" class="w-full">Dismiss all</Button></PopoverClose
					>
				</div>
			</PopoverContent>
		</Popover>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">
			Bind <code>open</code> with <code>$state</code> for programmatic control:
		</p>
		<div class="flex items-center gap-4">
			<Popover bind:open>
				<PopoverTrigger>
					<Button variant="outline">
						{open ? 'Close Popover' : 'Open Popover'}
					</Button>
				</PopoverTrigger>
				<PopoverContent class="w-72">
					<PopoverHeader>
						<PopoverTitle>Programmatic Popover</PopoverTitle>
						<PopoverDescription>This popover is controlled via bound state.</PopoverDescription>
					</PopoverHeader>
					<PopoverClose>
						<Button variant="outline" size="sm" class="w-full">Close</Button>
					</PopoverClose>
				</PopoverContent>
			</Popover>
			<div class="text-sm text-muted-foreground">
				Status:
				{#if open}
					<span class="ml-1 inline-block h-2 w-2 animate-pulse rounded-full bg-green-500"></span>
					Open
				{:else}
					<span class="ml-1 inline-block h-2 w-2 rounded-full bg-muted-foreground"></span>
					Closed
				{/if}
			</div>
		</div>
	</div>
</div>
