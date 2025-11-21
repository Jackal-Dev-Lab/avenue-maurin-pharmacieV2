import { ShoppingCart, Heart } from 'lucide-react';
import { useState } from 'react';

interface ProductCardProps {
  product: {
    id: string;
    name: string;
    brand: string | null;
    price: number;
    old_price: number | null;
    images: string[];
    is_new: boolean;
  };
}

export function ProductCard({ product }: ProductCardProps) {
  const [isFavorite, setIsFavorite] = useState(false);
  
  const discountPercentage = product.old_price
    ? Math.round(((product.old_price - product.price) / product.old_price) * 100)
    : 0;

  return (
    <div className="group relative bg-white rounded-lg overflow-hidden border hover:shadow-lg transition p-3">
      {/* Badges */}
      <div className="absolute top-2 left-2 z-10 flex flex-col gap-2">
        {product.is_new && (
          <span className="bg-green-500 text-white px-2 py-1 rounded text-xs font-semibold">
            Nouveau
          </span>
        )}
        {product.old_price && (
          <span className="bg-red-500 text-white px-2 py-1 rounded text-xs font-semibold">
            -{discountPercentage}%
          </span>
        )}
      </div>

      {/* Favorite Button */}
      <button
        onClick={() => setIsFavorite(!isFavorite)}
        className="absolute right-2 top-2 z-10 p-2 rounded-full bg-white/80 hover:bg-white"
      >
        <Heart 
          size={18} 
          className={isFavorite ? 'fill-red-500 text-red-500' : 'text-gray-600'}
        />
      </button>

      {/* Image */}
      <div className="aspect-square relative mb-3">
        <img
          src={product.images[0] || '/placeholder.svg'}
          alt={product.name}
          className="w-full h-full object-contain"
        />
      </div>

      {/* Content */}
      <div>
        {product.brand && (
          <p className="text-sm text-gray-500 mb-1">{product.brand}</p>
        )}
        <h3 className="font-medium text-sm line-clamp-2 mb-2">{product.name}</h3>
        
        {/* Price */}
        <div className="flex items-center gap-2 mb-3">
          <span className="text-lg font-bold text-pharmacy-DEFAULT">
            {product.price.toFixed(2)} €
          </span>
          {product.old_price && (
            <span className="text-sm text-gray-400 line-through">
              {product.old_price.toFixed(2)} €
            </span>
          )}
        </div>

        {/* Add to Cart */}
        <button className="w-full bg-pharmacy-DEFAULT hover:bg-pharmacy-dark text-white py-2 rounded-lg flex items-center justify-center gap-2 transition">
          <ShoppingCart size={18} />
          <span>Ajouter</span>
        </button>
      </div>
    </div>
  );
}
