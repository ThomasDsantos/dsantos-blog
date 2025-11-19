<template>
  <footer class="border-t border-gray-200 dark:border-gray-800 py-8">
    <UContainer>
      <div class="flex flex-col md:flex-row items-center justify-between gap-4">
        <div class="text-sm text-gray-600 dark:text-gray-400">
          © {{ new Date().getFullYear() }} Thomas Dsantos. Tous droits réservés.
        </div>

        <div class="flex items-center gap-4">
          <UButton
            icon="i-heroicons-envelope"
            variant="ghost"
            color="gray"
            aria-label="Email"
            to="mailto:contact@example.com"
          />
          <UButton
            icon="i-simple-icons-github"
            variant="ghost"
            color="gray"
            aria-label="GitHub"
            to="https://github.com"
            target="_blank"
          />
          <UButton
            icon="i-simple-icons-linkedin"
            variant="ghost"
            color="gray"
            aria-label="LinkedIn"
            to="https://linkedin.com"
            target="_blank"
          />
        </div>
      </div>
    </UContainer>
  </footer>
</template>
