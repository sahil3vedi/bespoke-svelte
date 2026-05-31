<script>
	import {
		Select,
		SelectTrigger,
		SelectValue,
		SelectContent,
		SelectItem,
		SelectGroup,
		SelectLabel,
		SelectSeparator
	} from '@sahil3vedi/bespoke-components';

	let fruit = $state('');
	let timezone = $state('');
	let role = $state('');
</script>

<div class="grid">
	<h1>Select</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<div class="mb-6 w-48">
		<Select bind:value={fruit}>
			<SelectTrigger>
				<SelectValue placeholder="Select a fruit" />
			</SelectTrigger>
			<SelectContent>
				<SelectItem value="apple">Apple</SelectItem>
				<SelectItem value="banana">Banana</SelectItem>
				<SelectItem value="blueberry">Blueberry</SelectItem>
				<SelectItem value="grapes">Grapes</SelectItem>
				<SelectItem value="pineapple">Pineapple</SelectItem>
			</SelectContent>
		</Select>
	</div>

	<!-- With Groups & Labels -->
	<h2>With Groups & Labels</h2>
	<div class="mb-6 w-56">
		<Select bind:value={timezone}>
			<SelectTrigger>
				<SelectValue placeholder="Select a timezone" />
			</SelectTrigger>
			<SelectContent>
				<SelectGroup>
					<SelectLabel>North America</SelectLabel>
					<SelectItem value="est">Eastern Standard Time (EST)</SelectItem>
					<SelectItem value="cst">Central Standard Time (CST)</SelectItem>
					<SelectItem value="mst">Mountain Standard Time (MST)</SelectItem>
					<SelectItem value="pst">Pacific Standard Time (PST)</SelectItem>
				</SelectGroup>
				<SelectSeparator />
				<SelectGroup>
					<SelectLabel>Europe</SelectLabel>
					<SelectItem value="gmt">Greenwich Mean Time (GMT)</SelectItem>
					<SelectItem value="cet">Central European Time (CET)</SelectItem>
					<SelectItem value="eet">Eastern European Time (EET)</SelectItem>
				</SelectGroup>
				<SelectSeparator />
				<SelectGroup>
					<SelectLabel>Asia</SelectLabel>
					<SelectItem value="ist">India Standard Time (IST)</SelectItem>
					<SelectItem value="cst-asia">China Standard Time (CST)</SelectItem>
					<SelectItem value="jst">Japan Standard Time (JST)</SelectItem>
				</SelectGroup>
			</SelectContent>
		</Select>
	</div>

	<!-- Disabled Items -->
	<h2>Disabled Items</h2>
	<div class="mb-6 w-48">
		<Select>
			<SelectTrigger>
				<SelectValue placeholder="Select a role" />
			</SelectTrigger>
			<SelectContent>
				<SelectItem value="admin">Admin</SelectItem>
				<SelectItem value="editor">Editor</SelectItem>
				<SelectItem value="viewer" disabled>Viewer (unavailable)</SelectItem>
				<SelectItem value="guest" disabled>Guest (unavailable)</SelectItem>
			</SelectContent>
		</Select>
	</div>

	<!-- Disabled Trigger -->
	<h2>Disabled</h2>
	<div class="mb-6 w-48">
		<Select disabled>
			<SelectTrigger>
				<SelectValue placeholder="Cannot select" />
			</SelectTrigger>
			<SelectContent>
				<SelectItem value="a">Option A</SelectItem>
				<SelectItem value="b">Option B</SelectItem>
			</SelectContent>
		</Select>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">Select a role to see the value reflected below.</p>
		<div class="flex flex-wrap items-center gap-4">
			<div class="w-48">
				<Select bind:value={role} onValueChange={(v) => (role = v)}>
					<SelectTrigger>
						<SelectValue placeholder="Select a role" />
					</SelectTrigger>
					<SelectContent>
						<SelectGroup>
							<SelectLabel>Roles</SelectLabel>
							<SelectItem value="admin">Admin</SelectItem>
							<SelectItem value="editor">Editor</SelectItem>
							<SelectItem value="viewer">Viewer</SelectItem>
						</SelectGroup>
					</SelectContent>
				</Select>
			</div>
			<div class="text-sm text-muted-foreground">
				{#if role}
					<span class="flex items-center gap-2">
						<span class="inline-block h-2 w-2 rounded-full bg-green-500"></span>
						Selected: <strong class="text-foreground">{role}</strong>
					</span>
				{:else}
					No role selected
				{/if}
			</div>
		</div>
		<div class="mt-4 text-sm text-muted-foreground">
			<p>The Select component:</p>
			<ul class="mt-1 list-inside list-disc space-y-1">
				<li>Shows a checkmark next to the selected item</li>
				<li>
					Closes on outside click or <code class="rounded bg-background px-1 py-0.5 text-foreground"
						>Escape</code
					>
				</li>
				<li>Supports groups with labels and separators</li>
				<li>Supports disabled items and the entire select</li>
			</ul>
		</div>
	</div>
</div>
