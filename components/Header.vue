<template>
  <header class="border-b border-gray-200 dark:border-gray-800">
    <UContainer>
      <nav class="flex items-center justify-between py-4">
        <NuxtLink to="/" class="text-xl font-bold">
          Thomas Dsantos
        </NuxtLink>

        <ul class="flex items-center gap-6">
          <li>
            <UButton
              to="/"
              variant="ghost"
              color="gray"
            >
              Accueil
            </UButton>
          </li>
          <li>
            <UButton
              to="/blog"
              variant="ghost"
              color="gray"
            >
              Blog
            </UButton>
          </li>
          <li>
            <UButton
              to="/portfolio"
              variant="ghost"
              color="gray"
            >
              Portfolio
            </UButton>
          </li>
          <li>
            <UButton
              icon="i-heroicons-moon"
              variant="ghost"
              color="gray"
              aria-label="Toggle dark mode"
              @click="toggleDark"
            />
          </li>
        </ul>
      </nav>
    </UContainer>
  </header>
</template>

<script setup lang="ts">
const colorMode = useColorMode()

const toggleDark = () => {
  colorMode.preference = colorMode.value === 'dark' ? 'light' : 'dark'
}
</script>
