import { useQuery } from '@tanstack/react-query';
import { supabase } from '@/lib/supabase';

export function useProducts() {
  return useQuery({
    queryKey: ['products'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('products')
        .select(`
          *,
          images:product_images(*),
          category:categories(*)
        `)
        .eq('is_active', true)
        .order('display_order', { ascending: true });
      
      if (error) throw error;
      
      return data.map(product => ({
        ...product,
        images: product.images
          .sort((a: any, b: any) => a.display_order - b.display_order)
          .map((img: any) => img.image_url)
      }));
    },
  });
}

export function useHeroSlides() {
  return useQuery({
    queryKey: ['hero-slides'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('hero_slides')
        .select('*')
        .eq('is_active', true)
        .order('display_order', { ascending: true });

      if (error) throw error;
      
      return data.map(slide => ({
        id: slide.id,
        image: slide.image_url,
        title: slide.title,
        description: slide.description || '',
        buttonText: slide.button_text || '',
        buttonLink: slide.button_link || '',
        theme: slide.theme as 'light' | 'dark'
      }));
    },
  });
}

export function useCategories() {
  return useQuery({
    queryKey: ['categories'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('categories')
        .select('*')
        .eq('is_active', true)
        .order('display_order', { ascending: true });

      if (error) throw error;
      return data;
    },
  });
}
