<script lang="ts">
	import { Textarea, Label } from '@sahil3vedi/bespoke-components';

	let bio = $state('');
	let feedback = $state('');
	let disabledText = $state('This textarea is disabled. You cannot edit this content.');
</script>

<div class="grid">
	<h1>Textarea</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<p class="mb-4 text-sm text-muted-foreground">Multi-line text input.</p>
	<div class="mb-6 max-w-sm">
		<Textarea placeholder="Type your message here." />
	</div>

	<!-- With Label -->
	<h2>With Label</h2>
	<div class="mb-6 grid max-w-sm gap-2">
		<Label for="p1-bio">Bio</Label>
		<Textarea id="p1-bio" placeholder="Tell us about yourself" rows={4} />
	</div>

	<!-- Disabled -->
	<h2>Disabled</h2>
	<div class="mb-6 max-w-sm">
		<Textarea disabled rows={3}>{disabledText}</Textarea>
	</div>

	<!-- Character Count -->
	<h2>Character Count</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Track remaining characters with a max length constraint.
	</p>
	<div class="mb-6 grid max-w-sm gap-2">
		<Label for="p1-feedback">Feedback (max 200 chars)</Label>
		<Textarea
			id="p1-feedback"
			bind:value={feedback}
			placeholder="Share your thoughts..."
			rows={4}
		/>
		<p class="text-xs text-muted-foreground">
			{feedback.length} / 200 characters
		</p>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">
			Bind to <code>value</code> with <code>$state</code>:
		</p>
		<div class="grid max-w-sm gap-2">
			<Label for="p1-ie-bio">Your Bio</Label>
			<Textarea id="p1-ie-bio" bind:value={bio} placeholder="Write something..." rows={5} />
			<div class="mt-2 text-sm text-muted-foreground">
				<p>
					Character count: <code class="rounded bg-background px-1 py-0.5">{bio.length}</code>
				</p>
				{#if bio}
					<p class="mt-2">
						Preview: <span class="italic">{bio.slice(0, 100)}{bio.length > 100 ? '...' : ''}</span>
					</p>
				{/if}
			</div>
		</div>
	</div>
</div>
