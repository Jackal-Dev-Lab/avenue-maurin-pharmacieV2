import { Link } from 'react-router-dom';
import { Facebook, Instagram, Mail, Phone, MapPin } from 'lucide-react';

export function Footer() {
  return (
    <footer className="bg-gray-900 text-white mt-20">
      <div className="container mx-auto px-4 py-12">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          <div>
            <h3 className="text-xl font-bold mb-4 text-pharmacy-DEFAULT">Pharmacie Maurin</h3>
            <p className="text-gray-400">Votre santé, notre priorité</p>
          </div>

          <div>
            <h4 className="font-semibold mb-4">Navigation</h4>
            <ul className="space-y-2 text-gray-400">
              <li><Link to="/" className="hover:text-pharmacy-DEFAULT">Accueil</Link></li>
              <li><Link to="/produits" className="hover:text-pharmacy-DEFAULT">Produits</Link></li>
              <li><Link to="/contact" className="hover:text-pharmacy-DEFAULT">Contact</Link></li>
            </ul>
          </div>

          <div>
            <h4 className="font-semibold mb-4">Contact</h4>
            <ul className="space-y-2 text-gray-400">
              <li className="flex items-center gap-2">
                <Phone size={16} />
                <span>04 XX XX XX XX</span>
              </li>
              <li className="flex items-center gap-2">
                <Mail size={16} />
                <span>contact@pharmacie-maurin.fr</span>
              </li>
              <li className="flex items-center gap-2">
                <MapPin size={16} />
                <span>Montpellier, France</span>
              </li>
            </ul>
          </div>

          <div>
            <h4 className="font-semibold mb-4">Suivez-nous</h4>
            <div className="flex gap-4">
              <a href="#" className="hover:text-pharmacy-DEFAULT">
                <Facebook size={24} />
              </a>
              <a href="#" className="hover:text-pharmacy-DEFAULT">
                <Instagram size={24} />
              </a>
            </div>
          </div>
        </div>

        <div className="border-t border-gray-800 mt-8 pt-8 text-center text-gray-400">
          <p>&copy; 2024 Pharmacie Maurin. Tous droits réservés.</p>
        </div>
      </div>
    </footer>
  );
}
