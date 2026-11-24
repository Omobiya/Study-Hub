const features = [
  { icon: "01", title: "Keep courses together", text: "Give every course its own space for notes, readings, and useful links." },
  { icon: "02", title: "Find it when you need it", text: "Search and organize resources with tags, without digging through folders." },
  { icon: "03", title: "Your resources stay yours", text: "StudyHub is designed around private, student-owned course materials." },
];

export default function Home() {
  return (
    <main>
      <nav className="nav wrap" aria-label="Main navigation">
        <a className="brand" href="#home"><span className="brand-mark">S</span> StudyHub</a>
        <a className="nav-link" href="#features">Explore features <span aria-hidden="true">↗</span></a>
      </nav>

      <section className="hero wrap" id="home">
        <div className="hero-copy">
          <p className="eyebrow"><span className="status-dot" /> YOUR STUDY SPACE, SIMPLIFIED</p>
          <h1>All your learning.<br /><span>One clear space.</span></h1>
          <p className="intro">Bring your course materials, useful links, and study resources together—so you can spend less time searching and more time learning.</p>
          <a className="button" href="#features">Discover StudyHub <span aria-hidden="true">→</span></a>
          <p className="note">A calmer way to stay on top of every course.</p>
        </div>

        <div className="preview" aria-label="Illustration of the StudyHub course dashboard">
          <div className="preview-top"><span className="mini-brand"><span className="brand-mark small">S</span> studyhub</span><span className="avatar">S</span></div>
          <div className="preview-body">
            <p className="preview-greeting">YOUR DASHBOARD</p>
            <h2>Good morning, student <span>✳</span></h2>
            <p className="preview-subtitle">Pick up where you left off.</p>
            <div className="course-heading">YOUR COURSES <span>03</span></div>
            <div className="course-card"><span className="course-icon lavender">⌘</span><span><b>Introduction to Psychology</b><small>8 resources · Updated today</small></span><i>↗</i></div>
            <div className="course-card"><span className="course-icon peach">◫</span><span><b>Research Methods</b><small>5 resources · Updated yesterday</small></span><i>↗</i></div>
            <div className="course-card"><span className="course-icon mint">✳</span><span><b>Human Biology</b><small>12 resources · 3 saved</small></span><i>↗</i></div>
            <div className="resource-pill"><span>✦</span> Keep your next study session in reach</div>
          </div>
        </div>
        <div className="decor decor-one" aria-hidden="true">✳</div>
        <div className="decor decor-two" aria-hidden="true">✦</div>
      </section>

      <section className="features wrap" id="features">
        <div className="section-heading"><p className="eyebrow">A LITTLE MORE FOCUS</p><h2>Built around the way<br />students actually study.</h2></div>
        <div className="feature-grid">{features.map((feature) => <article className="feature" key={feature.title}><span>{feature.icon}</span><h3>{feature.title}</h3><p>{feature.text}</p></article>)}</div>
      </section>

      <footer className="footer wrap"><a className="brand" href="#home"><span className="brand-mark">S</span> StudyHub</a><p>Make room for better learning.</p><span>© {new Date().getFullYear()} StudyHub</span></footer>
    </main>
  );
}
