<template>
  <div>
    <UContainer class="py-16">
      <div class="max-w-4xl mx-auto">
        <h1 class="text-4xl md:text-5xl font-bold mb-4">Blog</h1>
        <p class="text-lg text-gray-600 dark:text-gray-400 mb-12">
          Mes réflexions sur le développement web, les technologies et plus encore.
        </p>

        <!-- Search -->
        <div class="mb-8">
          <UInput
            v-model="search"
            icon="i-heroicons-magnifying-glass"
            placeholder="Rechercher un article..."
            size="lg"
          />
        </div>

        <!-- Articles List -->
        <div v-if="filteredArticles && filteredArticles.length > 0" class="space-y-6">
          <UCard
            v-for="article in filteredArticles"
            :key="article._path"
            class="hover:shadow-lg transition-shadow cursor-pointer"
            @click="navigateTo(article._path)"
          >
            <template #header>
              <div class="flex items-start justify-between gap-4">
                <div class="flex-1">
                  <h2 class="text-2xl font-semibold mb-2">{{ article.title }}</h2>
                  <div class="flex items-center gap-4 text-sm text-gray-500">
                    <span>{{ formatDate(article.date) }}</span>
                    <span v-if="article.tags" class="flex items-center gap-2">
                      <UBadge
                        v-for="tag in article.tags"
                        :key="tag"
                        size="sm"
                        variant="subtle"
                      >
                        {{ tag }}
                      </UBadge>
                    </span>
                  </div>
                </div>
              </div>
            </template>
            <p class="text-gray-600 dark:text-gray-400">
              {{ article.description }}
            </p>
            <template #footer>
              <UButton
                variant="ghost"
                trailing-icon="i-heroicons-arrow-right"
              >
                Lire l'article
              </UButton>
            </template>
          </UCard>
        </div>

        <!-- Empty State -->
        <div v-else class="text-center py-12">
          <p class="text-gray-500">Aucun article trouvé.</p>
        </div>
      </div>
    </UContainer>
  </div>
</template>

<script setup lang="ts">
const search = ref('')

const { data: articles } = await useAsyncData('blog-articles', () =>
  queryContent('/blog')
    .sort({ date: -1 })
    .find()
)

const filteredArticles = computed(() => {
  if (!articles.value) return []
  if (!search.value) return articles.value

  const searchLower = search.value.toLowerCase()
  return articles.value.filter((article) =>
    article.title?.toLowerCase().includes(searchLower) ||
    article.description?.toLowerCase().includes(searchLower) ||
    article.tags?.some((tag: string) => tag.toLowerCase().includes(searchLower))
  )
})

const formatDate = (date: string) => {
  return new Date(date).toLocaleDateString('fr-FR', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}
</script>
