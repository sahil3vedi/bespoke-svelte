<script lang="ts">
	import {
		Accordion,
		AccordionItem,
		AccordionTrigger,
		AccordionContent,
		Checkbox
	} from '@sahil3vedi/bespoke-components';

	const faq = [
		{
			value: 'item-1',
			question: 'Is it accessible?',
			answer:
				'Yes. It adheres to the WAI-ARIA design pattern using aria-expanded on the trigger button.'
		},
		{
			value: 'item-2',
			question: 'Is it styled?',
			answer:
				'Yes. It comes with default styles that match the other components. You can customise it via the class prop on any part.'
		},
		{
			value: 'item-3',
			question: 'Is it animated?',
			answer:
				'Yes. The content area uses a CSS grid-template-rows transition so it expands and collapses smoothly without JavaScript height calculation.'
		}
	];

	let singleValue = $state('item-1');
	let multiValue: string[] = $state([]);

	let notifications: Record<string, boolean> = $state({
		'Email digests': true,
		'Push notifications': false,
		'Weekly summary': false
	});
</script>

<div class="grid">
	<h1>Accordion</h1>

	<!-- Single (default) -->
	<h2>Single</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Only one item open at a time. <code>collapsible</code> lets you close the active item.
	</p>
	<Accordion class="max-w-xl">
		{#each faq as { value, question, answer } (value)}
			<AccordionItem {value}>
				<AccordionTrigger>{question}</AccordionTrigger>
				<AccordionContent>{answer}</AccordionContent>
			</AccordionItem>
		{/each}
	</Accordion>

	<!-- Multiple -->
	<h2 class="mt-10">Multiple</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Set <code>type="multiple"</code> to allow several items open simultaneously.
	</p>
	<Accordion type="multiple" class="max-w-xl">
		{#each faq as { value, question, answer } (value)}
			<AccordionItem {value}>
				<AccordionTrigger>{question}</AccordionTrigger>
				<AccordionContent>{answer}</AccordionContent>
			</AccordionItem>
		{/each}
	</Accordion>

	<!-- Controlled -->
	<h2 class="mt-10">Controlled</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Bind <code>value</code> to drive the open state externally.
	</p>
	<div class="mb-3 flex gap-2">
		{#each faq as { value } (value)}
			<button
				onclick={() => (singleValue = singleValue === value ? '' : value)}
				class="rounded-md border px-3 py-1 text-xs transition-colors {singleValue === value
					? 'border-primary bg-primary/10 text-primary'
					: 'border-border hover:bg-muted'}"
			>
				{value}
			</button>
		{/each}
	</div>
	<Accordion bind:value={singleValue} class="max-w-xl">
		{#each faq as { value, question, answer } (value)}
			<AccordionItem {value}>
				<AccordionTrigger>{question}</AccordionTrigger>
				<AccordionContent>{answer}</AccordionContent>
			</AccordionItem>
		{/each}
	</Accordion>

	<!-- Controlled multiple -->
	<h2 class="mt-10">Controlled Multiple</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Same with <code>type="multiple"</code> — open: <code>[{multiValue.join(', ')}]</code>
	</p>
	<Accordion type="multiple" bind:value={multiValue} class="max-w-xl">
		{#each faq as { value, question, answer } (value)}
			<AccordionItem {value}>
				<AccordionTrigger>{question}</AccordionTrigger>
				<AccordionContent>{answer}</AccordionContent>
			</AccordionItem>
		{/each}
	</Accordion>

	<!-- Disabled item -->
	<h2 class="mt-10">Disabled Item</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Set <code>disabled</code> on <code>AccordionItem</code> to prevent interaction.
	</p>
	<Accordion class="max-w-xl">
		{#each faq as { value, question, answer }, i (value)}
			<AccordionItem {value} disabled={i === 1}>
				<AccordionTrigger>{question}</AccordionTrigger>
				<AccordionContent>{answer}</AccordionContent>
			</AccordionItem>
		{/each}
	</Accordion>

	<!-- Custom content -->
	<h2 class="mt-10">Custom Content</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Any markup goes inside <code>AccordionContent</code>.
	</p>
	<Accordion class="max-w-xl">
		<AccordionItem value="profile">
			<AccordionTrigger>Profile settings</AccordionTrigger>
			<AccordionContent>
				<div class="grid gap-3">
					<div class="grid gap-1">
						<label for="acc-name" class="text-xs font-medium text-muted-foreground"
							>Display name</label
						>
						<input
							id="acc-name"
							class="rounded-md border border-input bg-background px-3 py-1.5 text-sm"
							placeholder="Your name"
						/>
					</div>
					<div class="grid gap-1">
						<label for="acc-bio" class="text-xs font-medium text-muted-foreground">Bio</label>
						<textarea
							id="acc-bio"
							class="rounded-md border border-input bg-background px-3 py-1.5 text-sm"
							rows="3"
							placeholder="Tell us about yourself"
						></textarea>
					</div>
				</div>
			</AccordionContent>
		</AccordionItem>
		<AccordionItem value="notifications">
			<AccordionTrigger>Notification preferences</AccordionTrigger>
			<AccordionContent>
				<div class="grid gap-2">
					{#each Object.keys(notifications) as label (label)}
						<label class="flex items-center gap-2 text-sm">
							<Checkbox bind:checked={notifications[label]} />
							{label}
						</label>
					{/each}
				</div>
			</AccordionContent>
		</AccordionItem>
		<AccordionItem value="danger">
			<AccordionTrigger class="text-destructive hover:text-destructive">
				Danger zone
			</AccordionTrigger>
			<AccordionContent>
				<p class="mb-3 text-muted-foreground">These actions are permanent and cannot be undone.</p>
				<button
					class="rounded-md bg-destructive px-3 py-1.5 text-xs font-medium text-destructive-foreground"
				>
					Delete account
				</button>
			</AccordionContent>
		</AccordionItem>
	</Accordion>
</div>
