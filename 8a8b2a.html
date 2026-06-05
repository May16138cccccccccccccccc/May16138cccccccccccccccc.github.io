
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, viewport-fit=cover">
  <title>可视化 · 公式实验室 | 陈安锦</title>
  <script src="https://cdn.tailwindcss.com/3.3.3"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.4.0/p5.min.js"></script>
  <style>
    :root {
      --bg: #090909;
      --panel-bg: rgba(12, 18, 30, 0.8);
      --text: #e5e7eb;
      --accent: #818cf8;
      --accent-glow: rgba(99, 102, 241, 0.4);
      --error: #f87171;
      --success: #34d399;
      --warning: #fbbf24;
      --border: rgba(255, 255, 255, 0.08);
      --input-bg: rgba(15, 23, 42, 0.75);
      --font-mono: 'SF Mono', 'Cascadia Code', 'JetBrains Mono', 'Fira Code', 'Consolas', 'Noto Sans SC', monospace;
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: 'Noto Sans SC', 'Inter', system-ui, sans-serif;
      background: var(--bg);
      color: var(--text);
      overflow-x: hidden;
      min-height: 100vh;
      -webkit-font-smoothing: antialiased;
    }

    #canvas-container {
      position: fixed;
      top: 0; left: 0;
      width: 100vw; height: 100vh;
      z-index: -1;
      pointer-events: none;
    }

    .bottom-panel {
      position: fixed;
      bottom: 16px;
      left: 50%;
      transform: translateX(-50%);
      width: min(94vw, 780px);
      z-index: 20;
      background: var(--panel-bg);
      backdrop-filter: blur(20px);
      -webkit-backdrop-filter: blur(20px);
      border-radius: 22px;
      border: 1px solid var(--border);
      box-shadow: 0 16px 48px 0 rgba(0,0,0,0.55), inset 0 0 0 1px rgba(255,255,255,0.04);
      padding: 18px 20px 16px;
      transition: all 0.25s ease;
    }

    .bottom-panel:hover {
      border-color: rgba(255,255,255,0.14);
      box-shadow: 0 20px 52px 0 rgba(0,0,0,0.65), inset 0 0 0 1px rgba(255,255,255,0.06);
    }

    .panel-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 12px;
      flex-wrap: wrap;
      gap: 8px;
    }

    .panel-title {
      font-size: 0.85rem;
      font-weight: 600;
      color: #a5b4fc;
      letter-spacing: 0.03em;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .author-tag {
      font-size: 0.7rem;
      color: #9ca3af;
      letter-spacing: 0.04em;
      font-weight: 400;
      white-space: nowrap;
    }

    .formula-input-wrap {
      display: flex;
      align-items: center;
      background: var(--input-bg);
      border-radius: 14px;
      border: 1.5px solid var(--border);
      transition: all 0.25s ease;
      overflow: hidden;
      gap: 0;
    }

    .formula-input-wrap:focus-within {
      border-color: rgba(129,140,248,0.6);
      box-shadow: 0 0 0 4px var(--accent-glow);
    }

    .formula-input-wrap.error-state {
      border-color: rgba(248,113,113,0.6);
      box-shadow: 0 0 0 4px rgba(248,113,113,0.2);
      animation: shake 0.4s ease;
    }

    @keyframes shake {
      0%,100% { transform: translateX(0); }
      20% { transform: translateX(-4px); }
      40% { transform: translateX(4px); }
      60% { transform: translateX(-3px); }
      80% { transform: translateX(3px); }
    }

    .formula-label {
      flex-shrink: 0;
      padding: 10px 8px 10px 14px;
      font-size: 0.75rem;
      font-weight: 600;
      color: #a5b4fc;
      font-family: var(--font-mono);
      background: rgba(99,102,241,0.08);
      border-right: 1px solid var(--border);
      border-radius: 14px 0 0 14px;
      user-select: none;
    }

    #formula-input {
      flex: 1;
      background: transparent;
      border: none;
      outline: none;
      color: #e2e8f0;
      font-family: var(--font-mono);
      font-size: 0.8rem;
      padding: 10px 12px;
      letter-spacing: 0.01em;
      caret-color: #818cf8;
      line-height: 1.4;
      min-width: 0;
    }

    #formula-input::placeholder {
      color: #4b5563;
      font-style: italic;
    }

    .status-dot {
      flex-shrink: 0;
      width: 10px;
      height: 10px;
      border-radius: 50%;
      margin-right: 14px;
      transition: all 0.3s ease;
      box-shadow: 0 0 8px currentColor;
    }

    .status-dot.valid { background: var(--success); color: var(--success); box-shadow: 0 0 10px var(--success); }
    .status-dot.invalid { background: var(--error); color: var(--error); box-shadow: 0 0 10px var(--error); }
    .status-dot.pending { background: var(--warning); color: var(--warning); box-shadow: 0 0 10px var(--warning); animation: pulse-dot 0.9s infinite; }

    @keyframes pulse-dot {
      0%,100% { opacity: 1; transform: scale(1); }
      50% { opacity: 0.4; transform: scale(1.7); }
    }

    .controls-row {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      gap: 8px;
      margin-top: 12px;
    }

    .preset-btn, .action-btn {
      font-size: 0.72rem;
      padding: 7px 14px;
      border-radius: 20px;
      border: 1px solid rgba(255,255,255,0.14);
      background: rgba(255,255,255,0.03);
      color: #cbd5e1;
      cursor: pointer;
      transition: all 0.2s ease;
      white-space: nowrap;
      font-family: 'Noto Sans SC', 'Inter', system-ui, sans-serif;
      letter-spacing: 0.02em;
      user-select: none;
      -webkit-tap-highlight-color: transparent;
      display: inline-flex;
      align-items: center;
      gap: 4px;
    }

    .preset-btn:hover, .action-btn:hover {
      background: rgba(129,140,248,0.18);
      border-color: rgba(129,140,248,0.4);
      color: #e2e8f0;
      transform: translateY(-1px);
      box-shadow: 0 6px 14px rgba(99,102,241,0.25);
    }

    .preset-btn.active-preset {
      background: rgba(129,140,248,0.28);
      border-color: rgba(129,140,248,0.6);
      color: #fff;
      font-weight: 600;
      box-shadow: 0 0 18px rgba(99,102,241,0.4);
    }

    .action-btn.random-btn {
      background: rgba(251, 191, 36, 0.12);
      border-color: rgba(251, 191, 36, 0.4);
      color: #fde68a;
    }

    .action-btn.random-btn:hover {
      background: rgba(251, 191, 36, 0.25);
      border-color: rgba(251, 191, 36, 0.6);
      box-shadow: 0 0 16px rgba(251,191,36,0.3);
    }

    .action-btn.auto-btn {
      background: rgba(52, 211, 153, 0.1);
      border-color: rgba(52, 211, 153, 0.35);
      color: #a7f3d0;
      transition: all 0.25s;
    }

    .action-btn.auto-btn.active-auto {
      background: rgba(52, 211, 153, 0.25);
      border-color: rgba(52, 211, 153, 0.6);
      box-shadow: 0 0 18px rgba(52,211,153,0.4);
      color: #fff;
      font-weight: 600;
    }

    .auto-interval-select {
      background: rgba(15,23,42,0.8);
      border: 1px solid rgba(255,255,255,0.15);
      border-radius: 20px;
      padding: 6px 10px;
      color: #cbd5e1;
      font-size: 0.7rem;
      margin-left: 4px;
      outline: none;
      cursor: pointer;
      font-family: 'Noto Sans SC', sans-serif;
    }

    .auto-interval-select option {
      background: #1e293b;
    }

    .vars-hint {
      margin-top: 8px;
      font-size: 0.62rem;
      color: #6b7280;
      display: flex;
      flex-wrap: wrap;
      gap: 2px 10px;
      align-items: center;
    }

    .vars-hint code {
      background: rgba(255,255,255,0.05);
      padding: 2px 6px;
      border-radius: 4px;
      font-family: var(--font-mono);
      font-size: 0.6rem;
      color: #94a3b8;
    }

    @media (max-width: 640px) {
      .bottom-panel { padding: 14px 14px; border-radius: 18px; bottom: 8px; }
      .preset-btn, .action-btn { font-size: 0.68rem; padding: 6px 12px; }
      #formula-input { font-size: 0.7rem; }
    }
  </style>
</head>
<body>
  <div id="canvas-container"></div>

  <div class="bottom-panel">
    <div class="panel-header">
      <span class="panel-title"><i class="fa-solid fa-flask"></i> 公式实验室</span>
      <span class="author-tag">陈安锦 2025</span>
    </div>

    <div class="formula-input-wrap" id="input-wrapper">
      <span class="formula-label">q =</span>
      <input type="text" id="formula-input" spellcheck="false" autocomplete="off" placeholder="表达式...">
      <span class="status-dot valid" id="status-dot" title="状态"></span>
    </div>

    <div class="controls-row" id="controls-row">
      <!-- 预设按钮由js动态生成，保证与数据同步 -->
    </div>

    <div class="vars-hint">
      <span>变量:</span> <code>x</code> <code>y</code> <code>k</code> <code>e</code> <code>d</code> <code>c</code> <code>t</code> <code>i</code>
      <span style="color:#4b5563;">|</span> <code>sin</code> <code>cos</code> <code>tan</code> <code>sqrt</code> <code>abs</code> <code>pow</code>
      <span style="color:#4b5563;">|</span> <code>PI</code> <code>E</code>
    </div>
  </div>

  <script>
    (function() {
      // ---------- 扩展预设库 (10个精选预设) ----------
      const presets = {
        original: { name: '🔮 原始', q: '3*sin(k*2)+0.3/(k+0.001)+sin(y/25)*k*(9+4*sin(e*9-d*3+t*2))' },
        ripple:   { name: '🌊 波纹', q: 'sin(k*3+t*0.7)*5+sin(y/12)*3+cos(d*2)*2' },
        vortex:   { name: '🌀 漩涡', q: 'k*2.5+sin(d*3+t)*4+cos(k*5+t*1.3)*2+0.5/(abs(k)+0.3)' },
        starburst:{ name: '⭐ 星芒', q: 'sin(k*6+t)*4+cos(e*4+t*0.8)*3+sin(y/18)*k*2+0.4/(abs(k)+0.2)' },
        flame:    { name: '🔥 火焰', q: '3*sin(k*1.8+t*1.2)+0.5/(abs(k)+0.15)+sin(y/30)*k*6*sin(e*5-d*2+t)' },
        lattice:  { name: '💎 晶格', q: 'sin(k*4)*3+cos(e*4)*3+sin(d*5+t*0.5)*2+0.6/(abs(k)+0.25)+cos(y/20)*k*1.5' },
        helix:    { name: '🧬 螺旋', q: 'cos(k*3+t*1.5)*4+sin(d*2.5)*3+sin(y/20+t)*k*2+0.7/(abs(k)+0.2)' },
        nebula:   { name: '🌌 星云', q: 'sin(k*2.2+t*0.9)*3.5+cos(e*3.5+t*0.5)*2.8+sin(y/28)*k*4+0.8/(abs(k)+0.25)+sin(d*1.7)*1.5' },
        plasma:   { name: '⚡ 等离子', q: 'tanh(k*2)*6+sin(d*4+t)*3+cos(k*5+t*0.7)*2+0.4/(abs(k)+0.1)' },
        glitch:   { name: '🎛️ 故障', q: 'sin(k*7+t*2)*2.5+cos(e*6)*2+sin(y/22+t)*k*3+0.9/(abs(k)+0.15)+cos(d*8)*1.8' }
      };

      // 当前状态
      let currentPresetKey = 'original';
      let currentQExpression = presets.original.q;
      let qFunction = null;
      let isFormulaValid = true;
      let debounceTimer = null;
      const DEBOUNCE_MS = 350;

      // 自动循环相关
      let autoIntervalId = null;
      let autoActive = false;
      let autoIntervalMs = 5000; // 默认5秒

      // DOM元素
      const formulaInput = document.getElementById('formula-input');
      const inputWrapper = document.getElementById('input-wrapper');
      const statusDot = document.getElementById('status-dot');
      const controlsRow = document.getElementById('controls-row');

      // ---------- 动态编译公式 ----------
      function compileExpression(expr) {
        const cleaned = expr.trim();
        if (!cleaned) throw new Error('表达式为空');
        return new Function('x','y','k','e','d','c','t','i',
          'PI','E','sin','cos','tan','sqrt','abs','pow','log','exp','atan2','floor','ceil','tanh',
          'return ' + cleaned);
      }

      function updateQFunction(expr) {
        try {
          const fn = compileExpression(expr);
          // 快速测试
          fn(1,1,1,1,1,1,0,0, Math.PI,Math.E, Math.sin,Math.cos,Math.tan,Math.sqrt,Math.abs,Math.pow,Math.log,Math.exp,Math.atan2,Math.floor,Math.ceil,Math.tanh);
          qFunction = fn;
          currentQExpression = expr;
          isFormulaValid = true;
          setStatus('valid');
          inputWrapper.classList.remove('error-state');
          return true;
        } catch (e) {
          isFormulaValid = false;
          setStatus('invalid');
          inputWrapper.classList.add('error-state');
          console.warn('公式编译失败:', e.message);
          return false;
        }
      }

      function setStatus(state) {
        statusDot.classList.remove('valid','invalid','pending');
        if (state === 'valid') statusDot.classList.add('valid');
        else if (state === 'invalid') statusDot.classList.add('invalid');
        else if (state === 'pending') statusDot.classList.add('pending');
      }

      // ---------- UI 更新 ----------
      function setInputValue(expr) {
        formulaInput.value = expr;
        adjustInputSize();
      }

      function adjustInputSize() {
        const len = formulaInput.value.length;
        formulaInput.style.fontSize = len > 65 ? '0.68rem' : (len > 45 ? '0.74rem' : '0.8rem');
      }

      function clearPresetHighlight() {
        document.querySelectorAll('.preset-btn').forEach(b => b.classList.remove('active-preset'));
      }

      function setActivePresetButton(key) {
        clearPresetHighlight();
        const btn = document.querySelector(`.preset-btn[data-preset="${key}"]`);
        if (btn) btn.classList.add('active-preset');
      }

      // 应用公式 (从预设或手动)
      function applyFormula(expr, presetKey = null) {
        setInputValue(expr);
        updateQFunction(expr);
        if (presetKey && presets[presetKey]) {
          currentPresetKey = presetKey;
          setActivePresetButton(presetKey);
        } else {
          currentPresetKey = null;
          clearPresetHighlight();
        }
        setStatus('valid');
        inputWrapper.classList.remove('error-state');
      }

      // 处理输入变化
      function handleInputChange(val, fromPreset = false) {
        if (!fromPreset) setStatus('pending');
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(() => {
          const success = updateQFunction(val);
          if (success) {
            if (!fromPreset) { currentPresetKey = null; clearPresetHighlight(); }
          } else if (!fromPreset && currentQExpression) {
            setInputValue(currentQExpression);
            adjustInputSize();
            setStatus('valid');
          }
        }, fromPreset ? 0 : DEBOUNCE_MS);
      }

      // ---------- 随机公式生成器 ----------
      function generateRandomFormula() {
        // 使用多个模块随机组合，保证有趣且相对稳定
        const components = [
          () => `${(Math.random()*5+1).toFixed(2)}*sin(k*${(Math.random()*5+1).toFixed(1)}+t*${(Math.random()*2).toFixed(2)})`,
          () => `${(Math.random()*4+1).toFixed(2)}*cos(e*${(Math.random()*4+1).toFixed(1)}+t*${(Math.random()*2).toFixed(2)})`,
          () => `${(Math.random()*3+0.5).toFixed(2)}*sin(d*${(Math.random()*4+1).toFixed(1)})`,
          () => `${(Math.random()*3+0.5).toFixed(2)}*cos(k*${(Math.random()*4+1).toFixed(1)})`,
          () => `sin(y/${(Math.random()*25+10).toFixed(0)}+t)*k*${(Math.random()*5+1).toFixed(1)}`,
          () => `cos(y/${(Math.random()*25+10).toFixed(0)})*k*${(Math.random()*4+1).toFixed(1)}`,
          () => `${(Math.random()*2+0.3).toFixed(2)}/(abs(k)+${(Math.random()*0.5+0.1).toFixed(2)})`,
          () => `${(Math.random()*3+0.5).toFixed(2)}*sin(e*${(Math.random()*5+1).toFixed(1)}-d*${(Math.random()*3+1).toFixed(1)}+t)`,
          () => `pow(k,${(Math.random()*2+0.5).toFixed(1)})*${(Math.random()*1.5+0.2).toFixed(2)}`,
          () => `tanh(k*${(Math.random()*3+1).toFixed(1)})*${(Math.random()*5+2).toFixed(2)}`,
        ];

        // 随机选择3-6个组件
        const count = Math.floor(Math.random() * 4) + 3;
        const selected = [];
        const indices = new Set();
        while (indices.size < count) {
          indices.add(Math.floor(Math.random() * components.length));
        }
        for (let idx of indices) {
          selected.push(components[idx]());
        }
        return selected.join('+');
      }

      function randomizeFormula() {
        const newExpr = generateRandomFormula();
        applyFormula(newExpr, null);
        // 随机按钮高亮一下
        const randBtn = document.getElementById('random-btn');
        if (randBtn) {
          randBtn.style.transform = 'scale(0.95)';
          setTimeout(() => { randBtn.style.transform = ''; }, 150);
        }
      }

      // ---------- 自动循环控制 ----------
      function startAutoCycle() {
        if (autoIntervalId) clearInterval(autoIntervalId);
        autoActive = true;
        document.getElementById('auto-btn').classList.add('active-auto');
        document.getElementById('auto-btn').innerHTML = '<i class="fa-solid fa-spin fa-circle-notch"></i> 自动中';
        autoIntervalId = setInterval(() => {
          randomizeFormula();
        }, autoIntervalMs);
      }

      function stopAutoCycle() {
        if (autoIntervalId) {
          clearInterval(autoIntervalId);
          autoIntervalId = null;
        }
        autoActive = false;
        document.getElementById('auto-btn').classList.remove('active-auto');
        document.getElementById('auto-btn').innerHTML = '<i class="fa-solid fa-play"></i> 自动';
      }

      function toggleAutoCycle() {
        if (autoActive) {
          stopAutoCycle();
        } else {
          startAutoCycle();
        }
      }

      function updateAutoInterval(value) {
        autoIntervalMs = parseInt(value, 10);
        if (autoActive) {
          // 重启定时器
          stopAutoCycle();
          startAutoCycle();
        }
      }

      // ---------- 构建UI按钮 ----------
      function buildControls() {
        controlsRow.innerHTML = '';
        // 预设按钮
        Object.entries(presets).forEach(([key, preset]) => {
          const btn = document.createElement('button');
          btn.className = 'preset-btn';
          if (key === currentPresetKey) btn.classList.add('active-preset');
          btn.dataset.preset = key;
          btn.textContent = preset.name;
          btn.addEventListener('click', () => {
            if (key === currentPresetKey && isFormulaValid) return;
            applyFormula(preset.q, key);
            // 如果自动模式开启，暂时停止？不，保留自动模式，但用户主动选择预设时最好停止自动，避免困惑
            if (autoActive) stopAutoCycle();
          });
          controlsRow.appendChild(btn);
        });

        // 分隔
        const sep = document.createElement('span');
        sep.style.width = '4px';
        controlsRow.appendChild(sep);

        // 随机按钮
        const randBtn = document.createElement('button');
        randBtn.id = 'random-btn';
        randBtn.className = 'action-btn random-btn';
        randBtn.innerHTML = '<i class="fa-solid fa-shuffle"></i> 随机';
        randBtn.addEventListener('click', () => {
          randomizeFormula();
          if (autoActive) stopAutoCycle();
        });
        controlsRow.appendChild(randBtn);

        // 自动按钮
        const autoBtn = document.createElement('button');
        autoBtn.id = 'auto-btn';
        autoBtn.className = 'action-btn auto-btn';
        autoBtn.innerHTML = '<i class="fa-solid fa-play"></i> 自动';
        autoBtn.addEventListener('click', toggleAutoCycle);
        controlsRow.appendChild(autoBtn);

        // 间隔选择
        const select = document.createElement('select');
        select.className = 'auto-interval-select';
        select.innerHTML = `
          <option value="3000">3秒</option>
          <option value="5000" selected>5秒</option>
          <option value="8000">8秒</option>
          <option value="12000">12秒</option>
        `;
        select.addEventListener('change', (e) => {
          updateAutoInterval(e.target.value);
        });
        controlsRow.appendChild(select);
      }

      // ---------- 事件绑定 ----------
      formulaInput.addEventListener('input', () => {
        adjustInputSize();
        const val = formulaInput.value;
        if (val.trim() === currentQExpression) {
          if (isFormulaValid) setStatus('valid');
          return;
        }
        handleInputChange(val, false);
      });

      formulaInput.addEventListener('keydown', (e) => {
        if (e.key === 'Enter') {
          e.preventDefault();
          clearTimeout(debounceTimer);
          const val = formulaInput.value;
          const success = updateQFunction(val);
          if (success) {
            currentPresetKey = null;
            clearPresetHighlight();
            setInputValue(val);
            adjustInputSize();
            setStatus('valid');
            if (autoActive) stopAutoCycle();
          } else if (currentQExpression) {
            setInputValue(currentQExpression);
            adjustInputSize();
            setStatus('valid');
          }
        } else if (e.key === 'Escape') {
          e.preventDefault();
          setInputValue(currentQExpression);
          adjustInputSize();
          setStatus('valid');
          inputWrapper.classList.remove('error-state');
          formulaInput.blur();
        }
      });

      formulaInput.addEventListener('blur', () => {
        if (!isFormulaValid && currentQExpression) {
          setInputValue(currentQExpression);
          adjustInputSize();
          setStatus('valid');
          inputWrapper.classList.remove('error-state');
        }
      });

      // ---------- 暴露给 p5 的接口 ----------
      window._getQValue = function(x, y, k, e, d, c, t, i) {
        if (!qFunction || !isFormulaValid) {
          return 3*Math.sin(k*2) + 0.3/(k+0.001) + Math.sin(y/25)*k*(9+4*Math.sin(e*9-d*3+t*2));
        }
        try {
          const res = qFunction(x,y,k,e,d,c,t,i, Math.PI,Math.E, Math.sin,Math.cos,Math.tan,Math.sqrt,Math.abs,Math.pow,Math.log,Math.exp,Math.atan2,Math.floor,Math.ceil,Math.tanh);
          return isFinite(res) ? res : 0;
        } catch { return 0; }
      };

      // 初始化
      function init() {
        buildControls();
        setInputValue(currentQExpression);
        updateQFunction(currentQExpression);
        setActivePresetButton('original');
        setStatus('valid');
      }

      init();

      // 清理定时器 (页面关闭时)
      window.addEventListener('beforeunload', () => {
        if (autoIntervalId) clearInterval(autoIntervalId);
      });

      console.log('✨ 公式实验室已启动 | 陈安锦 2025');
    })();
  </script>

  <script>
    // ---------- p5.js 动画核心 ----------
    function setup() {
      const canvas = createCanvas(windowWidth, windowHeight);
      canvas.parent('canvas-container');
      stroke(255, 150);
      pixelDensity(1);
    }

    let t = 0;
    const Pl = Math.PI;

    function windowResized() {
      resizeCanvas(windowWidth, windowHeight);
    }

    function draw() {
      background(9, 9, 9, 25);
      translate(width/2, height/2);
      t += Pl / 240;

      const useDynamic = window._getQValue && typeof window._getQValue === 'function';

      for (let i = 10000; i--;) {
        const x = i;
        const y = i / 235;
        const k = (4 + sin(y*2 - t)*3) * cos(x/9);
        const e = y/8 - 13;
        const d = sqrt(k*k + e*e);
        const c = d - t;

        let q;
        if (useDynamic) {
          q = window._getQValue(x, y, k, e, d, c, t, i);
        } else {
          q = 3*sin(k*2) + 0.3/(k+0.001) + sin(y/25)*k*(9+4*sin(e*9-d*3+t*2));
        }

        if (!isFinite(q)) q = 0;
        const px = q + 30*cos(c);
        const py = q*sin(c) + d*39 - height/2.5;
        point(px, py);
      }
    }
  </script>
</body>
</html>
