<?php

// This file has been auto-generated by the Symfony Dependency Injection Component for internal use.

if (\class_exists(\Container2dc6bxc\App_KernelDevDebugContainer::class, false)) {
    // no-op
} elseif (!include __DIR__.'/Container2dc6bxc/App_KernelDevDebugContainer.php') {
    touch(__DIR__.'/Container2dc6bxc.legacy');

    return;
}

if (!\class_exists(App_KernelDevDebugContainer::class, false)) {
    \class_alias(\Container2dc6bxc\App_KernelDevDebugContainer::class, App_KernelDevDebugContainer::class, false);
}

return new \Container2dc6bxc\App_KernelDevDebugContainer([
    'container.build_hash' => '2dc6bxc',
    'container.build_id' => 'a1ee3ba9',
    'container.build_time' => 1726144614,
], __DIR__.\DIRECTORY_SEPARATOR.'Container2dc6bxc');
