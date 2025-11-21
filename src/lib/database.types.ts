export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export interface Database {
  public: {
    Tables: {
      categories: {
        Row: {
          id: string
          name: string
          slug: string
          description: string | null
          image_url: string | null
          icon: string | null
          parent_id: string | null
          display_order: number
          is_active: boolean
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          name: string
          slug: string
          description?: string | null
          image_url?: string | null
          icon?: string | null
          parent_id?: string | null
          display_order?: number
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          name?: string
          slug?: string
          description?: string | null
          image_url?: string | null
          icon?: string | null
          parent_id?: string | null
          display_order?: number
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
      }
      products: {
        Row: {
          id: string
          name: string
          slug: string
          brand: string | null
          description: string | null
          short_description: string | null
          price: number
          old_price: number | null
          category_id: string | null
          stock_quantity: number
          stock_status: 'available' | 'lowStock' | 'outOfStock'
          rating: number
          review_count: number
          is_new: boolean
          is_featured: boolean
          is_irene_choice: boolean
          is_active: boolean
          display_order: number
          meta_title: string | null
          meta_description: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          name: string
          slug: string
          brand?: string | null
          description?: string | null
          short_description?: string | null
          price: number
          old_price?: number | null
          category_id?: string | null
          stock_quantity?: number
          stock_status?: 'available' | 'lowStock' | 'outOfStock'
          rating?: number
          review_count?: number
          is_new?: boolean
          is_featured?: boolean
          is_irene_choice?: boolean
          is_active?: boolean
          display_order?: number
          meta_title?: string | null
          meta_description?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          name?: string
          slug?: string
          brand?: string | null
          description?: string | null
          short_description?: string | null
          price?: number
          old_price?: number | null
          category_id?: string | null
          stock_quantity?: number
          stock_status?: 'available' | 'lowStock' | 'outOfStock'
          rating?: number
          review_count?: number
          is_new?: boolean
          is_featured?: boolean
          is_irene_choice?: boolean
          is_active?: boolean
          display_order?: number
          meta_title?: string | null
          meta_description?: string | null
          created_at?: string
          updated_at?: string
        }
      }
      product_images: {
        Row: {
          id: string
          product_id: string
          image_url: string
          alt_text: string | null
          display_order: number
          is_primary: boolean
          created_at: string
        }
        Insert: {
          id?: string
          product_id: string
          image_url: string
          alt_text?: string | null
          display_order?: number
          is_primary?: boolean
          created_at?: string
        }
        Update: {
          id?: string
          product_id?: string
          image_url?: string
          alt_text?: string | null
          display_order?: number
          is_primary?: boolean
          created_at?: string
        }
      }
      hero_slides: {
        Row: {
          id: string
          title: string
          description: string | null
          image_url: string
          button_text: string | null
          button_link: string | null
          theme: 'light' | 'dark'
          display_order: number
          is_active: boolean
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          title: string
          description?: string | null
          image_url: string
          button_text?: string | null
          button_link?: string | null
          theme?: 'light' | 'dark'
          display_order?: number
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          title?: string
          description?: string | null
          image_url?: string
          button_text?: string | null
          button_link?: string | null
          theme?: 'light' | 'dark'
          display_order?: number
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
      }
      site_images: {
        Row: {
          id: string
          key: string
          name: string
          description: string | null
          image_url: string
          alt_text: string | null
          category: string | null
          is_active: boolean
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          key: string
          name: string
          description?: string | null
          image_url: string
          alt_text?: string | null
          category?: string | null
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          key?: string
          name?: string
          description?: string | null
          image_url?: string
          alt_text?: string | null
          category?: string | null
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
      }
      team_members: {
        Row: {
          id: string
          name: string
          role: string
          bio: string | null
          photo_url: string | null
          email: string | null
          phone: string | null
          display_order: number
          is_active: boolean
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          name: string
          role: string
          bio?: string | null
          photo_url?: string | null
          email?: string | null
          phone?: string | null
          display_order?: number
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          name?: string
          role?: string
          bio?: string | null
          photo_url?: string | null
          email?: string | null
          phone?: string | null
          display_order?: number
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
      }
      advice_articles: {
        Row: {
          id: string
          title: string
          slug: string
          excerpt: string | null
          content: string
          author_id: string | null
          featured_image_url: string | null
          category: string | null
          tags: string[] | null
          is_published: boolean
          published_at: string | null
          views_count: number
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          title: string
          slug: string
          excerpt?: string | null
          content: string
          author_id?: string | null
          featured_image_url?: string | null
          category?: string | null
          tags?: string[] | null
          is_published?: boolean
          published_at?: string | null
          views_count?: number
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          title?: string
          slug?: string
          excerpt?: string | null
          content?: string
          author_id?: string | null
          featured_image_url?: string | null
          category?: string | null
          tags?: string[] | null
          is_published?: boolean
          published_at?: string | null
          views_count?: number
          created_at?: string
          updated_at?: string
        }
      }
      site_settings: {
        Row: {
          id: string
          key: string
          value: string | null
          type: string
          description: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          key: string
          value?: string | null
          type?: string
          description?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          key?: string
          value?: string | null
          type?: string
          description?: string | null
          created_at?: string
          updated_at?: string
        }
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
  }
}
