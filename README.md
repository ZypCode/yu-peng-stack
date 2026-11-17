# YuPeng 小栈（Hexo 博客）

个人技术博客源码，部署在 GitHub Pages 项目站：

**https://zypcode.github.io/yu-peng-stack/**

站点入口导航见 [ZypCode.github.io](https://zypcode.github.io/)。

## 本地预览

需要 Node.js 16 或 18（Hexo 3.8 与更高版本 Node 兼容性较差，推荐 16）。

```bash
npm ci
npx hexo server
```

浏览器打开终端提示的地址（默认 http://localhost:4000/yu-peng-stack/）。

## 发布

推送到 `main` 分支后，GitHub Actions 自动执行 `hexo generate` 并发布 Pages。

```bash
git add -A
git commit -m "..."
git push
```

## 写文章

```bash
npx hexo new "标题"
# 编辑 source/_posts/标题.md
```