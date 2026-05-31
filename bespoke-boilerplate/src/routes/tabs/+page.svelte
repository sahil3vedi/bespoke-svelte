<script lang="ts">
	import {
		Tabs,
		TabsList,
		TabsTrigger,
		TabsContent,
		Card,
		CardContent,
		Button,
		Input,
		Label
	} from '@sahil3vedi/bespoke-components';

	let tab = $state('account');
</script>

<div class="grid">
	<h1>Tabs</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		A set of layered sections of content—known as tab panels—that are displayed one at a time.
	</p>
	<div class="mb-6 max-w-md">
		<Tabs value="account" class="w-full">
			<TabsList>
				<TabsTrigger value="account">Account</TabsTrigger>
				<TabsTrigger value="password">Password</TabsTrigger>
			</TabsList>
			<Card class="rounded-tl-none border-t-0">
				<CardContent class="pt-6">
					<TabsContent value="account" class="grid gap-4">
						<div class="grid gap-2">
							<Label for="p3-name">Name</Label>
							<Input id="p3-name" value="John Doe" />
						</div>
						<div class="grid gap-2">
							<Label for="p3-email">Email</Label>
							<Input id="p3-email" type="email" value="john@example.com" />
						</div>
					</TabsContent>
					<TabsContent value="password" class="grid gap-4">
						<div class="grid gap-2">
							<Label for="p3-current">Current password</Label>
							<Input id="p3-current" type="password" />
						</div>
						<div class="grid gap-2">
							<Label for="p3-new">New password</Label>
							<Input id="p3-new" type="password" />
						</div>
					</TabsContent>
				</CardContent>
			</Card>
		</Tabs>
	</div>

	<!-- With Multiple Tabs -->
	<h2>Multiple Tabs</h2>
	<div class="mb-6 max-w-lg">
		<Tabs value="music" class="w-full">
			<TabsList>
				<TabsTrigger value="music">Music</TabsTrigger>
				<TabsTrigger value="podcasts">Podcasts</TabsTrigger>
				<TabsTrigger value="live" disabled>Live</TabsTrigger>
			</TabsList>
			<TabsContent value="music" class="mt-4 rounded-lg border p-6">
				<h3 class="font-semibold">Music</h3>
				<p class="mt-2 text-sm text-muted-foreground">
					Listen to your favorite songs and albums. Discover new artists and create playlists.
				</p>
			</TabsContent>
			<TabsContent value="podcasts" class="mt-4 rounded-lg border p-6">
				<h3 class="font-semibold">Podcasts</h3>
				<p class="mt-2 text-sm text-muted-foreground">
					Browse popular podcasts across categories. Subscribe and get notified about new episodes.
				</p>
			</TabsContent>
			<TabsContent value="live" class="mt-4 rounded-lg border p-6">
				<h3 class="font-semibold">Live Radio</h3>
				<p class="mt-2 text-sm text-muted-foreground">Coming soon.</p>
			</TabsContent>
		</Tabs>
	</div>

	<!-- Controlled -->
	<h2>Controlled</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Bind <code>value</code> with <code>$state</code> for programmatic control.
	</p>
	<div class="mb-6 max-w-md">
		<Tabs bind:value={tab} class="w-full">
			<TabsList>
				<TabsTrigger value="account">Account</TabsTrigger>
				<TabsTrigger value="password">Password</TabsTrigger>
				<TabsTrigger value="billing">Billing</TabsTrigger>
			</TabsList>
			<TabsContent value="account" class="mt-4 rounded-lg border p-6">
				<h3 class="font-semibold">Account settings</h3>
				<p class="mt-2 text-sm text-muted-foreground">Manage your account details.</p>
			</TabsContent>
			<TabsContent value="password" class="mt-4 rounded-lg border p-6">
				<h3 class="font-semibold">Password</h3>
				<p class="mt-2 text-sm text-muted-foreground">Change your password.</p>
			</TabsContent>
			<TabsContent value="billing" class="mt-4 rounded-lg border p-6">
				<h3 class="font-semibold">Billing</h3>
				<p class="mt-2 text-sm text-muted-foreground">Manage your subscription.</p>
			</TabsContent>
		</Tabs>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">
			Bind <code>value</code> with <code>$state</code>:
		</p>
		<div class="mt-4 flex items-center gap-4">
			<div class="flex gap-2">
				<Button size="sm" variant={tab === 'a' ? 'default' : 'outline'} onclick={() => (tab = 'a')}
					>Tab A</Button
				>
				<Button size="sm" variant={tab === 'b' ? 'default' : 'outline'} onclick={() => (tab = 'b')}
					>Tab B</Button
				>
				<Button size="sm" variant={tab === 'c' ? 'default' : 'outline'} onclick={() => (tab = 'c')}
					>Tab C</Button
				>
			</div>
			<div class="text-sm text-muted-foreground">
				Active: <code class="rounded bg-background px-1 py-0.5">{tab}</code>
			</div>
		</div>
		<div class="mt-4">
			{#if tab === 'a'}
				<div class="rounded-lg border border-border bg-background p-4">
					<p class="text-sm">Content for Tab A</p>
				</div>
			{:else if tab === 'b'}
				<div class="rounded-lg border border-border bg-background p-4">
					<p class="text-sm">Content for Tab B</p>
				</div>
			{:else}
				<div class="rounded-lg border border-border bg-background p-4">
					<p class="text-sm">Content for Tab C</p>
				</div>
			{/if}
		</div>
	</div>
</div>
