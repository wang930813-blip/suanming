
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title><{$title}></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
        }
        .msg-box {
            background: #fff;
            border-radius: 12px;
            padding: 50px 60px;
            text-align: center;
            box-shadow: 0 20px 60px rgba(0,0,0,0.2);
            max-width: 500px;
            width: 90%;
        }
        .msg-box h1 {
            font-size: 20px;
            color: #333;
            font-weight: 600;
            margin-bottom: 20px;
            line-height: 1.6;
        }
        .msg-box a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 24px;
            background: #1E9FFF;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            transition: all 0.3s;
        }
        .msg-box a:hover {
            background: #0d8ae8;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(30,159,255,0.3);
        }
    </style>
</head>
<body>
    <div class="msg-box">
        <h1><{$msg}></h1>
        <a href="<{$gourl}>">未跳转，点击此处</a>
    </div>
    <script>
    setTimeout(function() {
        window.location.href = "<{$gourl}>";
    }, 1500);
    </script>
</body>
</html>