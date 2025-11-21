import { HeroSlider } from '@/components/HeroSlider';
import { ProductList } from '@/components/ProductList';

export function Home() {
  return (
    <div>
      <HeroSlider />
      
      <div className="container mx-auto px-4 py-12">
        <h2 className="text-3xl font-bold mb-8">Nos Produits</h2>
        <ProductList />
      </div>

      {/* Features */}
      <div className="bg-gray-50 py-12 mt-12">
        <div className="container mx-auto px-4">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div className="text-center">
              <div className="w-16 h-16 bg-pharmacy-DEFAULT rounded-full flex items-center justify-center mx-auto mb-4">
                <span className="text-white text-2xl">🚚</span>
              </div>
              <h3 className="font-semibold mb-2">Livraison rapide</h3>
              <p className="text-gray-600">Livraison gratuite dès 49€</p>
            </div>
            <div className="text-center">
              <div className="w-16 h-16 bg-pharmacy-DEFAULT rounded-full flex items-center justify-center mx-auto mb-4">
                <span className="text-white text-2xl">💊</span>
              </div>
              <h3 className="font-semibold mb-2">Conseils d'experts</h3>
              <p className="text-gray-600">Pharmaciens à votre écoute</p>
            </div>
            <div className="text-center">
              <div className="w-16 h-16 bg-pharmacy-DEFAULT rounded-full flex items-center justify-center mx-auto mb-4">
                <span className="text-white text-2xl">✅</span>
              </div>
              <h3 className="font-semibold mb-2">Paiement sécurisé</h3>
              <p className="text-gray-600">Vos données sont protégées</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
