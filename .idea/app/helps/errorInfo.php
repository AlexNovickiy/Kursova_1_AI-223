<?php if (!empty($errMsg) && is_array($errMsg)): ?>
    <ul>
        <?php foreach ($errMsg as $error): ?>
            <li><?= htmlspecialchars($error, ENT_QUOTES); ?></li>
        <?php endforeach; ?>
    </ul>
<?php endif; ?>
