
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title><{$title}></title>
    <meta charset="utf-8" />
    <meta name="description" content="<{$title}>" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="/favicon.ico" />
    <link href="/acs/demo1/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/acs/demo1/css/style.bundle.css" rel="stylesheet" type="text/css" />
    <script src="images/js/jquery.js" type="text/javascript"></script>
</head>
	<body id="kt_body" class="auth-bg" style="background-image: url(/acs/demo1/media/auth/bg10.jpeg);">

    <div class="d-flex flex-column flex-center flex-column-fluid">
        <div class="d-flex flex-column flex-center text-center p-10">
            <div class="card card-flush w-lg-650px py-5" style="
                --bs-card-border-width: 1px;
    --bs-card-border-color: #F1F1F4;
    --bs-card-border-radius: 0.625rem;
    --bs-card-box-shadow: 0px 3px 4px 0px rgba(0, 0, 0, 0.03);
    --bs-card-inner-border-radius: calc(0.625rem - 1px);
    --bs-card-cap-padding-y: 0.5rem;
    --bs-card-cap-padding-x: 1rem;
    --bs-card-cap-bg: transparent;
    --bs-card-bg: var(--bs-body-bg);
    --bs-card-img-overlay-padding: 1rem;
    --bs-card-group-margin: 0.75rem;
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    height: var(--bs-card-height);
    color: var(--bs-body-color);
    word-wrap: break-word;
    background-color: var(--bs-card-bg);
    background-clip: border-box;
    border: var(--bs-card-border-width) solid var(--bs-card-border-color);
    border-radius: var(--bs-card-border-radius);
    box-shadow: var(--bs-card-box-shadow);">
                <div class="card-body py-15 py-lg-10">
                    <h1 class="fw-bolder text-gray-900 mb-5"><{$msg}></h1>
                </div>
            </div>
        </div>
    </div>
</div>
   <script lang='javascript'>
    setTimeout(function() {
        window.parent.location.reload();
        parent.jQuery('#edit_plate_modal').modal('hide');
    }, 1000);
   </script>
</body>
</html>
