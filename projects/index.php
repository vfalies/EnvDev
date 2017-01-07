<DOCTYPE html>
  <html>
  <head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style>

    body{
      margin-top:10px;
      background: #e0e0e0;
    }

    a {
      float: left;
    }

    .webblock {
      margin-right: 10px;
      line-height: 19px;
    }

    .webblock > .icon,
    .webblock > a > .icon {
      padding: 10px;
      float: left;
      background-color: #337ab7;
      line-height: 19px;
      color: white;
      height: 40px;
    }

    .webblock > a {
      padding-right: 0px;
    }

    .webblock > a.report_link {
      padding-right: 5px;
      min
    }

    .webblock > .text,
    .webblock > a > .text {
      padding: 10px;
      float: left;
      line-height: 19px;
      background-color: white;
      height: 40px;
    }

    .webblock > .spacer {
      width: 10px;
    }

    </style>
  </head>
  <?php
  $host = explode(':', $_SERVER['HTTP_HOST']);
  $http_host = $host[0];
  $http_port = isset($host[1]) ? $host[1] : '80';
  ?>
  <body>
    <div class="container">
      <div class="row">

        <div class="col-md-12 text-center">
          <h1>Web Development</h1>
        </div>

        <div class="col-md-12">

          <h3>Tools</h3>

            <?php
              $http_host = explode(':', $_SERVER['HTTP_HOST']);
              $host = $http_host[0];
              $port = (isset($http_host[1])) ? $http_host[1] : 80;
            ?>

            <a href="http://<?= $host.':'.$_ENV["PHPMYADMIN_PORT"]; ?>" target="_blank">
              <div class="webblock">
                <div class="icon"><i class="glyphicon glyphicon-th-list"></i></div>
                <div class="text">PhpMyAdmin</div>
              </div>
            </a>
            <a href="http://<?= $host.':'.$_ENV["MAILDEV_PORT"]; ?>" target="_blank">
              <div class="webblock">
                <div class="icon"><i class="glyphicon glyphicon-envelope"></i></div>
                <div class="text">MailDev</div>
              </div>
            </a>
            <a href="/phpinfo.php" target="_blank">
              <div class="webblock">
                <div class="icon"><i class="glyphicon glyphicon-info-sign"></i></div>
                <div class="text">PhpInfo</div>
              </div>
            </a>
        </div>

        <div class="col-md-12">
          <hr />
        </div>

        <div class="col-md-12">
          <h3>Projects</h3>

          <?php

          $entries = scandir('.');
          foreach ($entries as $entry):
            if ($entry == '.' || $entry == '..' || !is_dir($entry)):
              continue;
            else:
              $report = $entry.DIRECTORY_SEPARATOR.'logs'.DIRECTORY_SEPARATOR.'build'.DIRECTORY_SEPARATOR.'phpmetrics'.DIRECTORY_SEPARATOR.'report.html';
              ?>

                <a href="/<?= $entry; ?>/">
                  <div class="webblock">
                    <div class="icon"><i class="glyphicon glyphicon-folder-open"></i></div>
                    <div class="text"><?= $entry; ?></div>
                    <?php if (file_exists($report)):  ?>
                      <a href="<?= $report; ?>" target="_blank">
                        <div class="icon"><i class="glyphicon glyphicon-stats"></i></div>
                      </a>
                    <?php endif; ?>
                  </div>
                </a>
              <?php
            endif;
          endforeach;

          ?>
        </div>
      </div>
    </div>
  </body>
  </html>
