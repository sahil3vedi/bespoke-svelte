import tailwindcss from '@tailwindcss/vite';
import { defineConfig } from 'vitest/config';
import { playwright } from '@vitest/browser-playwright';
import { sveltekit } from '@sveltejs/kit/vite';

const sourceAlias = process.env.BESPOKE_SOURCE_ALIAS === 'true';

export default defineConfig({
	plugins: [tailwindcss(), sveltekit()],
	ssr: { noExternal: ['bits-ui', '@sahil3vedi/bespoke-components', 'lucide-svelte'] },
	...(sourceAlias && {
		server: { fs: { allow: ['..'] } },
		optimizeDeps: { exclude: ['@sahil3vedi/bespoke-components'] }
	}),
	test: {
		expect: { requireAssertions: true },
		projects: [
			{
				extends: './vite.config.ts',
				test: {
					name: 'client',
					browser: {
						enabled: true,
						provider: playwright(),
						instances: [{ browser: 'chromium', headless: true }]
					},
					include: ['src/**/*.svelte.{test,spec}.{js,ts}'],
					exclude: ['src/lib/server/**']
				}
			},

			{
				extends: './vite.config.ts',
				test: {
					name: 'server',
					environment: 'node',
					include: ['src/**/*.{test,spec}.{js,ts}'],
					exclude: ['src/**/*.svelte.{test,spec}.{js,ts}']
				}
			}
		]
	}
});
