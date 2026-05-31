<script>
	import {
		DropdownMenu,
		DropdownMenuTrigger,
		DropdownMenuContent,
		DropdownMenuItem,
		DropdownMenuLabel,
		DropdownMenuSeparator,
		Button
	} from '@sahil3vedi/bespoke-components';
	import {
		User,
		Settings,
		LogOut,
		CreditCard,
		Bell,
		Pencil,
		Trash2,
		Copy,
		Share2
	} from '@lucide/svelte';

	let lastAction = $state('');
</script>

<div class="grid">
	<h1>Dropdown Menu</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<div class="mb-6 flex flex-wrap gap-4">
		<DropdownMenu>
			<DropdownMenuTrigger>
				<Button variant="outline">Open Menu</Button>
			</DropdownMenuTrigger>
			<DropdownMenuContent>
				<DropdownMenuItem onclick={() => (lastAction = 'Profile')}>Profile</DropdownMenuItem>
				<DropdownMenuItem onclick={() => (lastAction = 'Settings')}>Settings</DropdownMenuItem>
				<DropdownMenuItem onclick={() => (lastAction = 'Logout')}>Logout</DropdownMenuItem>
			</DropdownMenuContent>
		</DropdownMenu>
	</div>

	<!-- With Label & Separator -->
	<h2>With Label & Separator</h2>
	<div class="mb-6 flex flex-wrap gap-4">
		<DropdownMenu>
			<DropdownMenuTrigger>
				<Button variant="outline">My Account</Button>
			</DropdownMenuTrigger>
			<DropdownMenuContent>
				<DropdownMenuLabel>My Account</DropdownMenuLabel>
				<DropdownMenuSeparator />
				<DropdownMenuItem onclick={() => (lastAction = 'Profile')}>Profile</DropdownMenuItem>
				<DropdownMenuItem onclick={() => (lastAction = 'Billing')}>Billing</DropdownMenuItem>
				<DropdownMenuItem onclick={() => (lastAction = 'Settings')}>Settings</DropdownMenuItem>
				<DropdownMenuSeparator />
				<DropdownMenuItem onclick={() => (lastAction = 'Logout')}>Logout</DropdownMenuItem>
			</DropdownMenuContent>
		</DropdownMenu>
	</div>

	<!-- With Icons -->
	<h2>With Icons</h2>
	<div class="mb-6 flex flex-wrap gap-4">
		<DropdownMenu>
			<DropdownMenuTrigger>
				<Button variant="outline">
					<User />
					Account
				</Button>
			</DropdownMenuTrigger>
			<DropdownMenuContent>
				<DropdownMenuLabel>My Account</DropdownMenuLabel>
				<DropdownMenuSeparator />
				<DropdownMenuItem onclick={() => (lastAction = 'Profile')}>
					<User />
					Profile
				</DropdownMenuItem>
				<DropdownMenuItem onclick={() => (lastAction = 'Billing')}>
					<CreditCard />
					Billing
				</DropdownMenuItem>
				<DropdownMenuItem onclick={() => (lastAction = 'Notifications')}>
					<Bell />
					Notifications
				</DropdownMenuItem>
				<DropdownMenuItem onclick={() => (lastAction = 'Settings')}>
					<Settings />
					Settings
				</DropdownMenuItem>
				<DropdownMenuSeparator />
				<DropdownMenuItem onclick={() => (lastAction = 'Logout')}>
					<LogOut />
					Logout
				</DropdownMenuItem>
			</DropdownMenuContent>
		</DropdownMenu>
	</div>

	<!-- Disabled Items -->
	<h2>Disabled Items</h2>
	<div class="mb-6 flex flex-wrap gap-4">
		<DropdownMenu>
			<DropdownMenuTrigger>
				<Button variant="outline">Actions</Button>
			</DropdownMenuTrigger>
			<DropdownMenuContent>
				<DropdownMenuItem onclick={() => (lastAction = 'Edit')}>
					<Pencil />
					Edit
				</DropdownMenuItem>
				<DropdownMenuItem onclick={() => (lastAction = 'Copy')}>
					<Copy />
					Copy
				</DropdownMenuItem>
				<DropdownMenuItem disabled>
					<Share2 />
					Share (unavailable)
				</DropdownMenuItem>
				<DropdownMenuSeparator />
				<DropdownMenuItem disabled>
					<Trash2 />
					Delete (unavailable)
				</DropdownMenuItem>
			</DropdownMenuContent>
		</DropdownMenu>
	</div>

	<!-- Alignment -->
	<h2>Alignment</h2>
	<div class="mb-6 flex flex-wrap gap-4">
		<DropdownMenu>
			<DropdownMenuTrigger>
				<Button variant="outline">Align Start</Button>
			</DropdownMenuTrigger>
			<DropdownMenuContent align="start">
				<DropdownMenuItem>Item One</DropdownMenuItem>
				<DropdownMenuItem>Item Two</DropdownMenuItem>
				<DropdownMenuItem>Item Three</DropdownMenuItem>
			</DropdownMenuContent>
		</DropdownMenu>

		<DropdownMenu>
			<DropdownMenuTrigger>
				<Button variant="outline">Align Center</Button>
			</DropdownMenuTrigger>
			<DropdownMenuContent align="center">
				<DropdownMenuItem>Item One</DropdownMenuItem>
				<DropdownMenuItem>Item Two</DropdownMenuItem>
				<DropdownMenuItem>Item Three</DropdownMenuItem>
			</DropdownMenuContent>
		</DropdownMenu>

		<DropdownMenu>
			<DropdownMenuTrigger>
				<Button variant="outline">Align End</Button>
			</DropdownMenuTrigger>
			<DropdownMenuContent align="end">
				<DropdownMenuItem>Item One</DropdownMenuItem>
				<DropdownMenuItem>Item Two</DropdownMenuItem>
				<DropdownMenuItem>Item Three</DropdownMenuItem>
			</DropdownMenuContent>
		</DropdownMenu>
	</div>

	<!-- Side -->
	<h2>Side</h2>
	<div class="mb-6 flex flex-wrap gap-4">
		<DropdownMenu>
			<DropdownMenuTrigger>
				<Button variant="outline">Opens Below</Button>
			</DropdownMenuTrigger>
			<DropdownMenuContent side="bottom">
				<DropdownMenuItem>Item One</DropdownMenuItem>
				<DropdownMenuItem>Item Two</DropdownMenuItem>
			</DropdownMenuContent>
		</DropdownMenu>

		<DropdownMenu>
			<DropdownMenuTrigger>
				<Button variant="outline">Opens Above</Button>
			</DropdownMenuTrigger>
			<DropdownMenuContent side="top">
				<DropdownMenuItem>Item One</DropdownMenuItem>
				<DropdownMenuItem>Item Two</DropdownMenuItem>
			</DropdownMenuContent>
		</DropdownMenu>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">Click an item to see the selection reflected below.</p>
		<div class="flex flex-wrap items-center gap-4">
			<DropdownMenu>
				<DropdownMenuTrigger>
					<Button>
						<User />
						User Menu
					</Button>
				</DropdownMenuTrigger>
				<DropdownMenuContent>
					<DropdownMenuLabel>Actions</DropdownMenuLabel>
					<DropdownMenuSeparator />
					<DropdownMenuItem onclick={() => (lastAction = 'Profile')}>
						<User />
						Profile
					</DropdownMenuItem>
					<DropdownMenuItem onclick={() => (lastAction = 'Settings')}>
						<Settings />
						Settings
					</DropdownMenuItem>
					<DropdownMenuSeparator />
					<DropdownMenuItem onclick={() => (lastAction = 'Logout')}>
						<LogOut />
						Logout
					</DropdownMenuItem>
				</DropdownMenuContent>
			</DropdownMenu>

			<div class="text-sm text-muted-foreground">
				{#if lastAction}
					<span class="flex items-center gap-2">
						<span class="inline-block h-2 w-2 rounded-full bg-green-500"></span>
						Last action: <strong class="text-foreground">{lastAction}</strong>
					</span>
				{:else}
					No action selected yet
				{/if}
			</div>
		</div>
	</div>
</div>
