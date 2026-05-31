<script>
	import { cn } from '../../../utils.js';

	/** @type {{
	 *   class?: string,
	 *   children?: import('svelte').Snippet,
	 *   [key: string]: any
	 * }} */
	let { class: className = '', children, ...restProps } = $props();
</script>

<div
	data-slot="page-container"
	class={cn('grid w-full min-w-0 overflow-x-auto px-7 pb-12 md:pl-28', className)}
	{...restProps}
>
	{@render children?.()}
</div>
