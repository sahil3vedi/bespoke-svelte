<script>
	import { cn } from '../../../utils.js';
	import { page } from '$app/state';
	import { resolve } from '$app/paths';
	import { browser } from '$app/environment';
	import { Sun, Moon, MonitorSmartphone } from '@lucide/svelte';
	import DropdownMenu from '../dropdown-menu/dropdown-menu.svelte';
	import DropdownMenuTrigger from '../dropdown-menu/dropdown-menu-trigger.svelte';
	import DropdownMenuContent from '../dropdown-menu/dropdown-menu-content.svelte';
	import DropdownMenuItem from '../dropdown-menu/dropdown-menu-item.svelte';
	import DropdownMenuLabel from '../dropdown-menu/dropdown-menu-label.svelte';
	import DropdownMenuSeparator from '../dropdown-menu/dropdown-menu-separator.svelte';
	import Tooltip from '../tooltip/tooltip.svelte';
	import TooltipTrigger from '../tooltip/tooltip-trigger.svelte';
	import TooltipContent from '../tooltip/tooltip-content.svelte';
	import TooltipProvider from '../tooltip/tooltip-provider.svelte';

	/** @type {{
	 *   sidebarItems: Array<import('../../../types.js').SidebarItem>,
	 *   collapsed?: boolean,
	 *   class?: string,
	 *   [key: string]: any
	 * }} */
	let { sidebarItems, collapsed = $bindable(false), class: className = '', ...restProps } = $props();

	/** @type {'light' | 'dark' | 'system'} */
	let theme = $state(
		/** @type {'light' | 'dark' | 'system'} */ (
			browser ? (localStorage.getItem('theme') ?? 'system') : 'system'
		)
	);

	/** @param {'light' | 'dark' | 'system'} t */
	function applyTheme(t) {
		if (!browser) return;
		const root = document.documentElement;
		if (t === 'dark') {
			root.classList.add('dark');
		} else if (t === 'light') {
			root.classList.remove('dark');
		} else {
			if (window.matchMedia('(prefers-color-scheme: dark)').matches) root.classList.add('dark');
			else root.classList.remove('dark');
		}
	}

	/** @param {'light' | 'dark' | 'system'} t */
	function setTheme(t) {
		theme = t;
		localStorage.setItem('theme', theme);
		applyTheme(theme);
	}

	$effect(() => {
		applyTheme(theme);
	});

	const themeConfig = {
		light: { icon: Sun, label: 'Light' },
		dark: { icon: Moon, label: 'Dark' },
		system: { icon: MonitorSmartphone, label: 'System' }
	};

	let themeLabel = $derived(themeConfig[theme].label + ' Theme');

	/** @param {string} path */
	function isActive(path) {
		if (path === '/') return page.url.pathname === '/';
		return page.url.pathname.startsWith(path);
	}
</script>

<aside
	data-slot="sidebar"
	class={cn(
		'absolute top-12 bottom-0 left-0 z-40 flex flex-col border-r border-border bg-background py-4 transition-all duration-150 ease-in-out',
		collapsed ? 'w-18 max-md:hidden' : 'w-56',
		className
	)}
	{...restProps}
>
	<TooltipProvider delayDuration={0}>
		<nav
			class="flex min-h-0 flex-1 flex-col gap-2 overflow-y-auto px-3.5 pb-4 [scrollbar-width:none] [&::-webkit-scrollbar]:hidden"
		>
		{#snippet navLink(item, props)}
			<a
				href={resolve(/** @type {any} */ (item.path))}
				{...props}
				class={cn(
					'flex h-10 items-center gap-3 rounded-lg px-3 transition-colors',
					isActive(item.path)
						? 'bg-muted text-foreground'
						: 'text-muted-foreground hover:bg-muted hover:text-foreground'
				)}
			>
				<item.icon class="size-4 shrink-0" />
				<span
					class={cn(
						'truncate text-sm font-medium transition-all duration-150',
						collapsed ? 'w-0 overflow-hidden opacity-0' : 'opacity-100'
					)}
				>
					{item.label}
				</span>
			</a>
		{/snippet}

		{#each sidebarItems as item (item.path)}
			{#if collapsed}
				<Tooltip>
					<TooltipTrigger>
						{#snippet child({ props })}
							{@render navLink(item, props)}
						{/snippet}
					</TooltipTrigger>
					<TooltipContent side="right" sideOffset={8}>
						{item.label}
					</TooltipContent>
				</Tooltip>
			{:else}
				{@render navLink(item, {})}
			{/if}
		{/each}
		</nav>
	</TooltipProvider>

	<hr class="mt-auto border-t border-border" />
	<div class="group/theme relative p-3.5 md:pb-0">
		<DropdownMenu>
			<DropdownMenuTrigger
				class="flex h-10 w-full items-center gap-3 rounded-lg px-3 text-muted-foreground transition-colors hover:bg-muted hover:text-foreground"
			>
				{#if theme === 'dark'}
					<Moon class="ml-0.5 size-4 shrink-0" />
				{:else if theme === 'light'}
					<Sun class="ml-0.5 size-4 shrink-0" />
				{:else}
					<MonitorSmartphone class="ml-0.5 size-4 shrink-0" />
				{/if}
				{#if !collapsed}
					<span class="truncate text-sm font-medium opacity-100 transition-all duration-150">
						{themeLabel}
					</span>
				{/if}
			</DropdownMenuTrigger>
			<DropdownMenuContent side="top" align="start" class="w-40">
				<DropdownMenuLabel>Theme</DropdownMenuLabel>
				<DropdownMenuSeparator />
				<DropdownMenuItem onclick={() => setTheme('light')}>
					<Sun class="size-4" />
					Light
				</DropdownMenuItem>
				<DropdownMenuItem onclick={() => setTheme('dark')}>
					<Moon class="size-4" />
					Dark
				</DropdownMenuItem>
				<DropdownMenuItem onclick={() => setTheme('system')}>
					<MonitorSmartphone class="size-4" />
					System
				</DropdownMenuItem>
			</DropdownMenuContent>
		</DropdownMenu>
		{#if collapsed}
			<div
				class="pointer-events-none absolute top-1/2 left-full z-50 ml-3 -translate-y-1/2 rounded-md border border-border bg-popover px-2 py-1 text-xs whitespace-nowrap text-popover-foreground opacity-0 shadow-md transition-opacity group-hover/theme:pointer-events-auto group-hover/theme:opacity-100"
			>
				{themeLabel}
			</div>
		{/if}
	</div>
</aside>
