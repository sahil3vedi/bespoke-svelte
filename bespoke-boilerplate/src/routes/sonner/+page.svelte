<script lang="ts">
	import { Toaster, Button, toast } from '@sahil3vedi/bespoke-components';

	let promiseLoading = $state(false);
</script>

<Toaster />

<div class="grid">
	<h1>Sonner (Toast)</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<p class="mb-4 text-sm text-muted-foreground">Simple notification toasts for user feedback.</p>
	<div class="mb-6 flex flex-wrap gap-3">
		<Button variant="outline" onclick={() => toast('Event has been created')}>Show Toast</Button>
		<Button
			variant="outline"
			onclick={() =>
				toast('Event has been created', {
					description: 'Monday, January 3rd at 6:00 PM',
					action: {
						label: 'Undo',
						onClick: () => toast('Undone!')
					}
				})}
		>
			Toast with Action
		</Button>
	</div>

	<!-- Variants -->
	<h2>Variants</h2>
	<p class="mb-4 text-sm text-muted-foreground">Different toast types for different contexts.</p>
	<div class="mb-6 flex flex-wrap gap-3">
		<Button
			variant="outline"
			class="border-green-600 text-green-600 hover:bg-green-50"
			onclick={() => toast.success('Profile updated successfully!')}
		>
			Success
		</Button>
		<Button
			variant="outline"
			class="border-red-600 text-red-600 hover:bg-red-50"
			onclick={() => toast.error('Failed to save changes.')}
		>
			Error
		</Button>
		<Button
			variant="outline"
			class="border-blue-600 text-blue-600 hover:bg-blue-50"
			onclick={() => toast.info('New update available.')}
		>
			Info
		</Button>
		<Button
			variant="outline"
			class="border-amber-600 text-amber-600 hover:bg-amber-50"
			onclick={() => toast.warning('Your session is about to expire.')}
		>
			Warning
		</Button>
		<Button
			variant="outline"
			onclick={() => {
				const id = toast.loading('Uploading file...');
				setTimeout(() => {
					toast.dismiss(id);
					toast.success('File uploaded!');
				}, 2000);
			}}
		>
			Loading
		</Button>
	</div>

	<!-- Rich Content -->
	<h2>Rich Content</h2>
	<p class="mb-4 text-sm text-muted-foreground">Toasts can include descriptions and actions.</p>
	<div class="mb-6 flex flex-wrap gap-3">
		<Button
			variant="outline"
			onclick={() =>
				toast('Invitation sent', {
					description: 'You invited lisa@example.com to the project.',
					action: {
						label: '✓',
						onClick: () => toast('Invitation confirmed!')
					}
				})}
		>
			With Description
		</Button>
		<Button
			variant="outline"
			onclick={() =>
				toast('File deleted', {
					description: 'my-doc.pdf has been moved to trash.',
					action: {
						label: 'Undo',
						onClick: () => toast.success('File restored!')
					}
				})}
		>
			With Undo
		</Button>
	</div>

	<!-- Promise Toast -->
	<h2>Promise Toast</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Automatically update toast state based on a Promise lifecycle.
	</p>
	<div class="mb-6">
		<Button
			variant="outline"
			disabled={promiseLoading}
			onclick={() => {
				promiseLoading = true;
				const fakeSave = () =>
					new Promise<{ name: string }>((resolve, reject) => {
						setTimeout(() => {
							if (Math.random() > 0.3) {
								resolve({ name: 'MyProject' });
							} else {
								reject(new Error('Network error'));
							}
							promiseLoading = false;
						}, 2000);
					});

				toast.promise(fakeSave, {
					loading: 'Saving project...',
					success: (data) => `${data?.name ?? 'Project'} saved successfully!`,
					error: 'Failed to save project.'
				});
			}}
		>
			{promiseLoading ? 'Saving...' : 'Save Project (Promise)'}
		</Button>
	</div>

	<!-- Programmatic Dismiss -->
	<h2>Programmatic Control</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Dismiss toasts programmatically using <code>toast.dismiss()</code>.
	</p>
	<div class="mb-6 flex flex-wrap gap-3">
		<Button
			variant="outline"
			onclick={() => {
				const id = toast('This toast will auto-dismiss in 5 seconds...');
				setTimeout(() => toast.dismiss(id), 5000);
			}}
		>
			Auto-dismiss (5s)
		</Button>
		<Button variant="outline" onclick={() => toast.dismiss()}>Dismiss All Toasts</Button>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">
			Import <code>&#123; toast &#125;</code> from <code>svelte-sonner</code> and mount
			<code>&#123; Toaster &#125;</code> once in your layout or page:
		</p>
		<div class="mt-4 space-y-2">
			<pre class="overflow-x-auto rounded bg-background p-3 text-xs"><code
					>import &#123; toast &#125; from 'svelte-sonner';
import &#123; Toaster &#125; from '@sahil3vedi/bespoke-components';

// Trigger from anywhere
toast.success('Saved!');
toast.error('Error occurred.');
toast.promise(saveData(), &#123;
  loading: 'Saving...',
  success: 'Done!',
  error: 'Failed.'
&#125;);</code
				></pre>
		</div>
	</div>
</div>
