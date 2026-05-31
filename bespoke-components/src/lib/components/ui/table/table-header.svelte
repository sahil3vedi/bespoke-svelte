<script>
	import { cn } from '../../../utils.js';

	/** @type {{ children?: import('svelte').Snippet, class?: string, [key: string]: any }} */
	let { children, class: className = '', ...restProps } = $props();
</script>

<thead
	class={cn(
		'[&_tr]:border-b [&_tr]:border-border [&_tr]:bg-muted/50 [&_tr]:hover:bg-muted/50',
		className
	)}
	{...restProps}
>
	{@render children?.()}
</thead>
