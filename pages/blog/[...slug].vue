<template>
  <div>
    <UContainer class="py-16">
      <article class="max-w-3xl mx-auto">
        <!-- Article Header -->
        <header class="mb-12">
          <h1 class="text-4xl md:text-5xl font-bold mb-4">{{ article?.title }}</h1>
          <div class="flex items-center gap-4 text-gray-600 dark:text-gray-400 mb-4">
            <span>{{ formatDate(article?.date) }}</span>
            <span v-if="article?.readingTime">•</span>
            <span v-if="article?.readingTime">{{ article.readingTime }} min de lecture</span>
          </div>
          <div v-if="article?.tags" class="flex items-center gap-2">
            <UBadge v-for="tag in article.tags" :key="tag" variant="subtle">
              {{ tag }}
            </UBadge>
          </div>
        </header>

        <!-- Article Content -->
        <div class="prose prose-slate dark:prose-invert max-w-none">
          <ContentRenderer :value="article" />
        </div>

        <!-- Navigation -->
        <div class="mt-12 pt-8 border-t border-gray-200 dark:border-gray-800">
          <UButton to="/blog" variant="ghost" icon="i-heroicons-arrow-left">
            Retour au blog
          </UButton>
        </div>
      </article>
    </UContainer>
  </div>
</template>

<script setup lang="ts">
const route = useRoute()

const { data: article } = await useAsyncData(`blog-${route.path}`, () =>
  queryContent(route.path).findOne()
)

if (!article.value) {
  throw createError({
    statusCode: 404,
    message: 'Article non trouvé'
  })
}

const formatDate = (date: string) => {
  if (!date) return ''
  return new Date(date).toLocaleDateString('fr-FR', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}

useHead({
  title: article.value?.title,
  meta: [{ name: 'description', content: article.value?.description }]
})
</script>
