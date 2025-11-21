import { Mail, Phone, MapPin } from 'lucide-react';

export function Contact() {
  return (
    <div className="container mx-auto px-4 py-12">
      <h1 className="text-4xl font-bold mb-8">Contactez-nous</h1>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-12">
        {/* Contact Info */}
        <div>
          <h2 className="text-2xl font-semibold mb-6">Nos coordonnées</h2>
          
          <div className="space-y-4">
            <div className="flex items-start gap-4">
              <div className="w-12 h-12 bg-pharmacy-DEFAULT/10 rounded-lg flex items-center justify-center flex-shrink-0">
                <Phone className="text-pharmacy-DEFAULT" size={24} />
              </div>
              <div>
                <h3 className="font-semibold mb-1">Téléphone</h3>
                <p className="text-gray-600">04 XX XX XX XX</p>
              </div>
            </div>

            <div className="flex items-start gap-4">
              <div className="w-12 h-12 bg-pharmacy-DEFAULT/10 rounded-lg flex items-center justify-center flex-shrink-0">
                <Mail className="text-pharmacy-DEFAULT" size={24} />
              </div>
              <div>
                <h3 className="font-semibold mb-1">Email</h3>
                <p className="text-gray-600">contact@pharmacie-maurin.fr</p>
              </div>
            </div>

            <div className="flex items-start gap-4">
              <div className="w-12 h-12 bg-pharmacy-DEFAULT/10 rounded-lg flex items-center justify-center flex-shrink-0">
                <MapPin className="text-pharmacy-DEFAULT" size={24} />
              </div>
              <div>
                <h3 className="font-semibold mb-1">Adresse</h3>
                <p className="text-gray-600">
                  123 Rue de la Santé<br />
                  34000 Montpellier<br />
                  France
                </p>
              </div>
            </div>
          </div>
        </div>

        {/* Contact Form */}
        <div>
          <h2 className="text-2xl font-semibold mb-6">Envoyez-nous un message</h2>
          
          <form className="space-y-4">
            <div>
              <label className="block text-sm font-medium mb-2">Nom</label>
              <input 
                type="text" 
                className="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-pharmacy-DEFAULT focus:border-transparent"
                placeholder="Votre nom"
              />
            </div>

            <div>
              <label className="block text-sm font-medium mb-2">Email</label>
              <input 
                type="email" 
                className="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-pharmacy-DEFAULT focus:border-transparent"
                placeholder="votre@email.com"
              />
            </div>

            <div>
              <label className="block text-sm font-medium mb-2">Message</label>
              <textarea 
                rows={5}
                className="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-pharmacy-DEFAULT focus:border-transparent"
                placeholder="Votre message..."
              />
            </div>

            <button 
              type="submit"
              className="w-full bg-pharmacy-DEFAULT hover:bg-pharmacy-dark text-white py-3 rounded-lg font-semibold transition"
            >
              Envoyer le message
            </button>
          </form>
        </div>
      </div>
    </div>
  );
}
