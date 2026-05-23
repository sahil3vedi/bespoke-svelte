<script>
	import { cn } from '../../../utils.js';

	/** @type {{ children?: import('svelte').Snippet, class?: string, [key: string]: any }} */
	let { children, class: className = '', ...restProps } = $props();
</script>

<div class="relative w-full overflow-x-auto">
	<table class={cn('min-w-full caption-bottom text-sm', className)} {...restProps}>
		{@render children?.()}
	</table>
</div>
