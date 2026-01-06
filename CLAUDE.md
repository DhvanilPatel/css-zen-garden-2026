# CSS Zen Garden - Project Instructions

## Goal
Create a modern CSS Zen Garden-like website showcasing 20 unique CSS art pieces. Each piece demonstrates different CSS techniques while being a complete, self-contained mini-website.

## Structure
```
css-zen-garden/
├── index.html          # Gallery landing page
├── styles/
│   └── main.css        # Gallery styles
├── pieces/
│   └── {name}/
│       ├── index.html  # The art piece
│       └── style.css   # Its styles
└── assets/             # Shared images (optional)
```

## Requirements for Each Piece
1. **Self-contained** - One HTML file + one CSS file
2. **No Lorem Ipsum** - Use creative, relevant, fictional text
3. **Responsive** - Must work on mobile
4. **Pure CSS** - Minimal JS (only for interactions if absolutely needed)
5. **Unique technique** - Each piece showcases something different

## CSS Techniques to Showcase (pick different ones)
- CSS Grid art
- Flexbox compositions
- CSS gradients (linear, radial, conic)
- CSS animations/keyframes
- 3D transforms (perspective, rotate3d)
- Clip-path shapes
- Blend modes
- CSS filters
- Custom properties (variables)
- CSS shapes (shape-outside)
- Pseudo-elements (::before, ::after)
- CSS counters
- Scroll-snap
- Container queries
- CSS masks
- Text effects (text-shadow, background-clip)
- CSS patterns (repeating gradients)
- Aspect-ratio tricks
- CSS-only dark mode
- Motion-safe animations

## Naming Convention
Use kebab-case descriptive names:
- `neon-dreams`
- `geometric-sunrise`
- `floating-islands`
- `paper-fold`
etc.

## Testing
After creating a piece, verify it:
1. Opens correctly in browser
2. Is responsive
3. Has no console errors

## Deployment
Will be deployed to Cloudflare Pages via GitHub.
