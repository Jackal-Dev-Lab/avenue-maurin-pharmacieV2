import { Link } from 'react-router-dom';
import { ShoppingCart, Heart, User, Menu } from 'lucide-react';

export function Header() {
  return (
    <header className="bg-white shadow-sm sticky top-0 z-50">
      <div className="container mx-auto px-4">
        <div className="flex items-center justify-between h-16">
          <Link to="/" className="text-2xl font-bold text-pharmacy-DEFAULT">
            Pharmacie Maurin
          </Link>
          
          <nav className="hidden md:flex gap-6">
            <Link to="/" className="hover:text-pharmacy-DEFAULT">Accueil</Link>
            <Link to="/produits" className="hover:text-pharmacy-DEFAULT">Produits</Link>
            <Link to="/contact" className="hover:text-pharmacy-DEFAULT">Contact</Link>
          </nav>

          <div className="flex items-center gap-4">
            <button className="p-2 hover:text-pharmacy-DEFAULT">
              <Heart size={20} />
            </button>
            <button className="p-2 hover:text-pharmacy-DEFAULT">
              <User size={20} />
            </button>
            <button className="p-2 hover:text-pharmacy-DEFAULT relative">
              <ShoppingCart size={20} />
              <span className="absolute -top-1 -right-1 bg-pharmacy-DEFAULT text-white text-xs rounded-full w-5 h-5 flex items-center justify-center">
                0
              </span>
            </button>
            <button className="md:hidden p-2">
              <Menu size={24} />
            </button>
          </div>
        </div>
      </div>
    </header>
  );
}
