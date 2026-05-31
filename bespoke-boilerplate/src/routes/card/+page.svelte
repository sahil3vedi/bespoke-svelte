<script lang="ts">
	import {
		Card,
		CardHeader,
		CardTitle,
		CardDescription,
		CardContent,
		CardFooter,
		CardAction,
		Button,
		Badge
	} from '@sahil3vedi/bespoke-components';
	import { BellRing, CreditCard, Zap, ArrowUpRight } from 'lucide-svelte';
</script>

<div class="grid">
	<h1>Card</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Displays content in a contained layout with optional header and footer.
	</p>
	<div class="mb-6 max-w-sm">
		<Card>
			<CardHeader>
				<CardTitle>Card Title</CardTitle>
				<CardDescription>Card Description</CardDescription>
			</CardHeader>
			<CardContent>
				<p class="text-sm text-muted-foreground">
					Card content goes here. This is the main body of the card.
				</p>
			</CardContent>
			<CardFooter>
				<Button variant="outline" size="sm">Cancel</Button>
				<Button size="sm">Save</Button>
			</CardFooter>
		</Card>
	</div>

	<!-- With Image -->
	<h2>With Content</h2>
	<p class="mb-4 text-sm text-muted-foreground">Cards can contain rich content.</p>
	<div class="mb-6 grid gap-6 md:grid-cols-2">
		<Card>
			<CardHeader>
				<CardTitle class="flex items-center gap-2">
					<BellRing class="size-5" />
					Notifications
				</CardTitle>
				<CardDescription>Manage your notification preferences.</CardDescription>
			</CardHeader>
			<CardContent class="grid gap-2">
				<div class="flex items-center justify-between rounded-lg border p-3">
					<div>
						<p class="text-sm font-medium">Email</p>
						<p class="text-xs text-muted-foreground">Daily digest</p>
					</div>
					<Badge variant="secondary">Enabled</Badge>
				</div>
				<div class="flex items-center justify-between rounded-lg border p-3">
					<div>
						<p class="text-sm font-medium">Push</p>
						<p class="text-xs text-muted-foreground">Real-time alerts</p>
					</div>
					<Badge variant="outline">Disabled</Badge>
				</div>
			</CardContent>
			<CardFooter>
				<Button variant="outline" size="sm" class="w-full">Manage</Button>
			</CardFooter>
		</Card>

		<Card>
			<CardHeader>
				<CardTitle class="flex items-center gap-2">
					<CreditCard class="size-5" />
					Payment Method
				</CardTitle>
				<CardDescription>Your default payment method.</CardDescription>
			</CardHeader>
			<CardContent>
				<div class="flex items-center gap-4 rounded-lg border p-4">
					<CreditCard class="size-8 text-muted-foreground" />
					<div>
						<p class="font-medium">•••• 4242</p>
						<p class="text-xs text-muted-foreground">Expires 12/28</p>
					</div>
				</div>
			</CardContent>
			<CardFooter>
				<CardAction>
					<Button variant="outline" size="sm" href="#" onclick={(e: Event) => e.preventDefault()}>
						<ArrowUpRight class="size-4" />
					</Button>
				</CardAction>
			</CardFooter>
		</Card>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">Card composition with all sub-components:</p>
		<div class="mt-4 max-w-md">
			<Card>
				<CardHeader>
					<CardTitle class="flex items-center gap-2">
						<Zap class="size-5 text-orange-500" />
						Pro Plan
					</CardTitle>
					<CardDescription>$29/month — billed annually.</CardDescription>
				</CardHeader>
				<CardContent class="grid gap-2">
					<div class="flex items-center gap-2 text-sm">
						<span class="inline-block h-1.5 w-1.5 rounded-full bg-green-500"></span>
						Unlimited projects
					</div>
					<div class="flex items-center gap-2 text-sm">
						<span class="inline-block h-1.5 w-1.5 rounded-full bg-green-500"></span>
						Priority support
					</div>
					<div class="flex items-center gap-2 text-sm">
						<span class="inline-block h-1.5 w-1.5 rounded-full bg-green-500"></span>
						Advanced analytics
					</div>
				</CardContent>
				<CardFooter>
					<Button class="w-full">Upgrade to Pro</Button>
				</CardFooter>
			</Card>
		</div>
		<div class="mt-4 text-sm text-muted-foreground">
			<ul class="mt-1 list-inside list-disc space-y-1">
				<li>
					<code>CardHeader</code> contains <code>CardTitle</code> + <code>CardDescription</code>
				</li>
				<li><code>CardContent</code> holds the main body</li>
				<li><code>CardFooter</code> typically contains actions</li>
				<li><code>CardAction</code> for top-right corner actions</li>
			</ul>
		</div>
	</div>
</div>
