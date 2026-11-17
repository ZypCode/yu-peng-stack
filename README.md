# YuPeng 小栈（Hexo 博客）

个人技术博客源码，部署在 GitHub Pages 项目站：

**https://zypcode.github.io/yu-peng-stack/**

站点入口导航见 [ZypCode.github.io](https://zypcode.github.io/)。

## 本地预览

需要 Node.js 18 或 20（当前 Hexo 7.3）。

```bash
npm ci
npm run server
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

`package.json` 需保留 `"hexo": { "version": "..." }` 字段，否则 `hexo-cli` 无法识别本站目录。

```bash
npx hexo new "标题"
# 编辑 source/_posts/标题.md
```