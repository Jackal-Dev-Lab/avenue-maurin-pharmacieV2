import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { ChevronLeft, ChevronRight } from 'lucide-react';
import { useHeroSlides } from '@/hooks/useSupabase';

export function HeroSlider() {
  const { data: slides, isLoading } = useHeroSlides();
  const [currentSlide, setCurrentSlide] = useState(0);

  const nextSlide = () => {
    if (!slides) return;
    setCurrentSlide((prev) => (prev === slides.length - 1 ? 0 : prev + 1));
  };

  const prevSlide = () => {
    if (!slides) return;
    setCurrentSlide((prev) => (prev === 0 ? slides.length - 1 : prev - 1));
  };

  useEffect(() => {
    if (!slides || slides.length === 0) return;
    
    const interval = setInterval(() => {
      nextSlide();
    }, 5000);

    return () => clearInterval(interval);
  }, [slides]);

  if (isLoading) {
    return (
      <div className="relative h-[400px] lg:h-[500px] bg-gray-200 animate-pulse" />
    );
  }

  if (!slides || slides.length === 0) {
    return null;
  }

  return (
    <div className="relative h-[400px] lg:h-[500px] overflow-hidden">
      {slides.map((slide, index) => (
        <div
          key={slide.id}
          className={`absolute inset-0 transition-opacity duration-500 ${
            index === currentSlide ? 'opacity-100' : 'opacity-0'
          }`}
          style={{ 
            backgroundImage: `url(${slide.image})`,
            backgroundSize: 'cover',
            backgroundPosition: 'center'
          }}
        >
          <div className="absolute inset-0 bg-black/40 flex items-center">
            <div className="container mx-auto px-4">
              <div className="max-w-lg text-white">
                <h1 className="text-4xl lg:text-5xl font-bold mb-4">
                  {slide.title}
                </h1>
                <p className="text-lg mb-6 opacity-90">
                  {slide.description}
                </p>
                {slide.buttonText && slide.buttonLink && (
                  <Link 
                    to={slide.buttonLink}
                    className="inline-block bg-pharmacy-DEFAULT hover:bg-pharmacy-dark text-white px-8 py-3 rounded-lg font-semibold transition"
                  >
                    {slide.buttonText}
                  </Link>
                )}
              </div>
            </div>
          </div>
        </div>
      ))}

      {slides.length > 1 && (
        <>
          <button 
            onClick={prevSlide} 
            className="absolute left-4 top-1/2 -translate-y-1/2 bg-white/20 hover:bg-white/40 text-white p-2 rounded-full"
          >
            <ChevronLeft size={24} />
          </button>
          <button 
            onClick={nextSlide} 
            className="absolute right-4 top-1/2 -translate-y-1/2 bg-white/20 hover:bg-white/40 text-white p-2 rounded-full"
          >
            <ChevronRight size={24} />
          </button>

          <div className="absolute bottom-4 left-0 right-0 flex justify-center gap-2">
            {slides.map((_, index) => (
              <button
                key={index}
                onClick={() => setCurrentSlide(index)}
                className={`w-3 h-3 rounded-full transition ${
                  index === currentSlide ? 'bg-white scale-125' : 'bg-white/50'
                }`}
              />
            ))}
          </div>
        </>
      )}
    </div>
  );
}
