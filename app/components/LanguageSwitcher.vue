<script setup lang="ts">
const { locale, setLocale } = useI18n()

const languageItems = computed(() => [
  {
    label: 'English',
    icon: 'i-flag-gb-4x3',
    value: 'en',
    onSelect: () => setLocale('en'),
  },
  {
    label: 'Français',
    icon: 'i-flag-fr-4x3',
    value: 'fr',
    onSelect: () => setLocale('fr'),
  },
])

const currentLocale = computed(() => languageItems.value.find(item => item.value === locale.value) || languageItems.value[0])
</script>

<template>
  <UDropdownMenu :items="languageItems" :popper="{ placement: 'bottom-end' }">
    <UButton
      :icon="currentLocale.icon || 'i-flag-gb-4x3'"
      variant="ghost"
      color="secondary"
      :aria-label="$t('common.language')"
    />

    <template #item="{ item }">
      <div class="flex items-center gap-2">
        <UIcon :name="item.icon" class="w-5 h-5" />
        <span>{{ item.label }}</span>
      </div>
    </template>
  </UDropdownMenu>
</template>
