<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>心的告白</title>
<style>
body {
  margin: 0;
  background: linear-gradient(135deg, #000000, #1a001a);
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  overflow: hidden;
  font-family: 'Microsoft YaHei', sans-serif;
  color: white;
  flex-direction: column;
}

.container {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  z-index: 10;
}

.heart {
  position: relative;
  width: 100px;
  height: 100px;
  background-color: #ff2c75;
  box-shadow: 0 0 60px #ff2c75, 0 0 120px #ff2c75;
  transform: rotate(-45deg);
  animation: beat 1s infinite;
  cursor: pointer;
  transition: transform 0.3s;
}

.heart:hover {
  transform: rotate(-45deg) scale(1.1);
}

.heart::before,
.heart::after {
  content: '';
  position: absolute;
  width: 100px;
  height: 100px;
  background-color: #ff2c75;
  border-radius: 50%;
}

.heart::before {
  top: -50px;
  left: 0;
}

.heart::after {
  left: 50px;
  top: 0;
}

@keyframes beat {
  0%, 100% { transform: scale(1) rotate(-45deg); }
  50% { transform: scale(1.2) rotate(-45deg); }
}

.text {
  position: relative;
  color: white;
  font-size: 24px;
  text-align: center;
  margin-top: 40px;
  padding: 15px 30px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 20px;
  backdrop-filter: blur(5px);
  opacity: 0;
  transform: translateY(20px);
  transition: opacity 1s, transform 1s;
}

.text.show {
  opacity: 1;
  transform: translateY(0);
}

.controls {
  margin-top: 30px;
  display: flex;
  gap: 15px;
}

button {
  background: rgba(255, 255, 255, 0.2);
  border: none;
  color: white;
  padding: 10px 20px;
  border-radius: 30px;
  cursor: pointer;
  backdrop-filter: blur(5px);
  transition: background 0.3s;
}

button:hover {
  background: rgba(255, 255, 255, 0.3);
}

.petal {
  position: absolute;
  background: rgba(255, 255, 255, 0.6);
  border-radius: 50% 0% 50% 50%;
  transform: rotate(45deg);
  opacity: 0.7;
  z-index: 1;
  animation: fall linear forwards;
}

@keyframes fall {
  to {
    transform: translateY(100vh) rotate(360deg);
    opacity: 0;
  }
}

.heartbeat {
  position: absolute;
  border: 1px solid #ff2c75;
  border-radius: 50%;
  height: 100px;
  width: 100px;
  opacity: 0;
  animation: heartbeat 2s infinite;
}

@keyframes heartbeat {
  0% {
    transform: scale(0.5);
    opacity: 0.8;
  }
  100% {
    transform: scale(2);
    opacity: 0;
  }
}

/* 响应式设计 */
@media (max-width: 600px) {
  .heart {
    width: 80px;
    height: 80px;
  }
  
  .heart::before,
  .heart::after {
    width: 80px;
    height: 80px;
  }
  
  .heart::before {
    top: -40px;
  }
  
  .heart::after {
    left: 40px;
  }
  
  .text {
    font-size: 18px;
    padding: 10px 20px;
  }
}

/* 音乐图标 */
.music-toggle {
  position: fixed;
  top: 20px;
  right: 20px;
  width: 30px;
  height: 30px;
  cursor: pointer;
  z-index: 100;
}

.music-toggle::before,
.music-toggle::after {
  content: '';
  position: absolute;
  background: white;
}

.music-toggle::before {
  width: 10px;
  height: 20px;
  border-radius: 10px 0 0 10px;
  left: 0;
  top: 5px;
}

.music-toggle::after {
  width: 20px;
  height: 20px;
  border-radius: 50%;
  right: 0;
  top: 5px;
}

.music-toggle .note {
  position: absolute;
  background: white;
  width: 2px;
  height: 15px;
  left: 7px;
  top: 0;
  animation: note 1s infinite;
}

@keyframes note {
  0% { height: 15px; }
  50% { height: 10px; }
  100% { height: 15px; }
}
</style>
</head>
<body>
<div class="container">
  <div class="heart" id="heart"></div>
  <div class="text" id="text">我喜欢你！</div>
  <div class="controls">
    <button id="prevBtn">上一条</button>
    <button id="nextBtn">下一条</button>
  </div>
</div>

<div class="music-toggle" id="musicToggle">
  <div class="note"></div>
</div>

<audio id="bgMusic" loop>
  <source src="https://example.com/romantic-music.mp3" type="audio/mpeg">
  您的浏览器不支持音频元素。
</audio>

<script>
// 表白消息数组
const messages = [
  "我喜欢你！",
  "你是我生命中最美的风景",
  "每一天因你而更加美好",
  "我想和你一起慢慢变老",
  "你的笑容是我最大的幸福",
  "我爱你，从现在到永远"
];

// 初始化变量
let currentMessageIndex = 0;
const textElement = document.getElementById('text');
const heartElement = document.getElementById('heart');
const prevBtn = document.getElementById('prevBtn');
const nextBtn = document.getElementById('nextBtn');
const musicToggle = document.getElementById('musicToggle');
const bgMusic = document.getElementById('bgMusic');

// 显示消息函数
function showMessage(index) {
  textElement.classList.remove('show');
  
  setTimeout(() => {
    textElement.textContent = messages[index];
    textElement.classList.add('show');
  }, 300);
}

// 初始化显示第一条消息
setTimeout(() => {
  textElement.classList.add('show');
}, 500);

// 心形点击效果
heartElement.addEventListener('click', function() {
  // 创建心跳波纹效果
  for (let i = 0; i < 3; i++) {
    setTimeout(() => {
      const heartbeat = document.createElement('div');
      heartbeat.classList.add('heartbeat');
      heartbeat.style.left = '0';
      heartbeat.style.top = '0';
      heartElement.appendChild(heartbeat);
      
      setTimeout(() => {
        heartElement.removeChild(heartbeat);
      }, 2000);
    }, i * 300);
  }
  
  // 切换到下一条消息
  currentMessageIndex = (currentMessageIndex + 1) % messages.length;
  showMessage(currentMessageIndex);
});

// 上一消息按钮
prevBtn.addEventListener('click', function() {
  currentMessageIndex = (currentMessageIndex - 1 + messages.length) % messages.length;
  showMessage(currentMessageIndex);
});

// 下一消息按钮
nextBtn.addEventListener('click', function() {
  currentMessageIndex = (currentMessageIndex + 1) % messages.length;
  showMessage(currentMessageIndex);
});

// 创建飘落的花瓣
function createPetals() {
  for (let i = 0; i < 30; i++) {
    setTimeout(() => {
      const petal = document.createElement('div');
      petal.classList.add('petal');
      
      // 随机大小和位置
      const size = Math.random() * 15 + 5;
      petal.style.width = `${size}px`;
      petal.style.height = `${size}px`;
      petal.style.left = `${Math.random() * 100}vw`;
      petal.style.top = `-${size}px`;
      
      // 随机颜色（粉色系）
      const pinkShades = [
        '#ffb6c1', '#ffc0cb', '#ffd1dc', '#fbb', '#f8c8dc'
      ];
      petal.style.background = pinkShades[Math.floor(Math.random() * pinkShades.length)];
      
      // 随机动画时长
      const duration = Math.random() * 10 + 5;
      petal.style.animationDuration = `${duration}s`;
      
      document.body.appendChild(petal);
      
      // 动画结束后移除花瓣
      setTimeout(() => {
        document.body.removeChild(petal);
      }, duration * 1000);
    }, i * 500);
  }
}

// 每10秒创建一批花瓣
setInterval(createPetals, 10000);
createPetals(); // 初始创建

// 音乐控制
let musicPlaying = false;
musicToggle.addEventListener('click', function() {
  if (musicPlaying) {
    bgMusic.pause();
    musicPlaying = false;
  } else {
    bgMusic.play().catch(e => {
      console.log("自动播放被阻止，请手动交互后重试");
    });
    musicPlaying = true;
  }
});

// 用户交互后尝试播放音乐
document.body.addEventListener('click', function() {
  if (!musicPlaying) {
    bgMusic.play().then(() => {
      musicPlaying = true;
    }).catch(e => {
      // 需要用户明确交互
    });
  }
}, { once: true });
</script>
</body>
</html>
