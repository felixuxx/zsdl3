const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const mod = b.addModule("zsdl3", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .link_libc = true,
    });

    mod.linkSystemLibrary("SDL3", .{});
    mod.linkSystemLibrary("SDL3_image", .{});
    mod.linkSystemLibrary("SDL3_mixer", .{});

    const exe = b.addExecutable(.{
        .name = "zsdl3",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    exe.root_module.linkSystemLibrary("SDL3", .{});
    exe.root_module.linkSystemLibrary("SDL3_ttf", .{});

    // Renderer example
    const renderer = b.addExecutable(.{
        .name = "renderer",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/renderer.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    renderer.root_module.linkSystemLibrary("SDL3", .{});
    b.installArtifact(renderer);

    const run_renderer_step = b.step("run-renderer", "Run the renderer example");
    const run_renderer_cmd = b.addRunArtifact(renderer);
    run_renderer_step.dependOn(&run_renderer_cmd.step);
    run_renderer_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_renderer_cmd.addArgs(args);
    }

    // 3D Cube example
    const cube_3d = b.addExecutable(.{
        .name = "cube_3d",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/cube_3d.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    cube_3d.root_module.linkSystemLibrary("SDL3", .{});
    b.installArtifact(cube_3d);

    const run_cube_3d_step = b.step("run-cube-3d", "Run the 3D cube example");
    const run_cube_3d_cmd = b.addRunArtifact(cube_3d);
    run_cube_3d_step.dependOn(&run_cube_3d_cmd.step);
    run_cube_3d_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cube_3d_cmd.addArgs(args);
    }

    // GPU example
    const gpu = b.addExecutable(.{
        .name = "gpu",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/gpu.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    gpu.root_module.linkSystemLibrary("SDL3", .{});
    b.installArtifact(gpu);

    const run_gpu_step = b.step("run-gpu", "Run the GPU example");
    const run_gpu_cmd = b.addRunArtifact(gpu);
    run_gpu_step.dependOn(&run_gpu_cmd.step);
    run_gpu_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_gpu_cmd.addArgs(args);
    }

    // Image example
    const image = b.addExecutable(.{
        .name = "image",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/image.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    image.root_module.linkSystemLibrary("SDL3", .{});
    image.root_module.linkSystemLibrary("SDL3_image", .{});
    b.installArtifact(image);

    const run_image_step = b.step("run-image", "Run the image example");
    const run_image_cmd = b.addRunArtifact(image);
    run_image_cmd.setCwd(b.path("examples"));
    run_image_step.dependOn(&run_image_cmd.step);
    run_image_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_image_cmd.addArgs(args);
    }

    // Basic 2D example
    const basic_2d = b.addExecutable(.{
        .name = "basic_2d",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/basic_2d.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    basic_2d.root_module.linkSystemLibrary("SDL3", .{});
    b.installArtifact(basic_2d);

    const run_basic_2d_step = b.step("run-basic-2d", "Run the basic 2D example");
    const run_basic_2d_cmd = b.addRunArtifact(basic_2d);
    run_basic_2d_step.dependOn(&run_basic_2d_cmd.step);
    run_basic_2d_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_basic_2d_cmd.addArgs(args);
    }

    // TTF example
    const ttf = b.addExecutable(.{
        .name = "ttf",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/ttf.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    ttf.root_module.linkSystemLibrary("SDL3", .{});
    ttf.root_module.linkSystemLibrary("SDL3_ttf", .{});
    b.installArtifact(ttf);

    const run_ttf_step = b.step("run-ttf", "Run the TTF example");
    const run_ttf_cmd = b.addRunArtifact(ttf);
    run_ttf_cmd.setCwd(b.path("examples"));
    run_ttf_step.dependOn(&run_ttf_cmd.step);
    run_ttf_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_ttf_cmd.addArgs(args);
    }

    // Text editor example
    const text_editor = b.addExecutable(.{
        .name = "text_editor",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/text_editor.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    text_editor.root_module.linkSystemLibrary("SDL3", .{});
    text_editor.root_module.linkSystemLibrary("SDL3_ttf", .{});
    b.installArtifact(text_editor);

    const run_text_editor_step = b.step("run-text-editor", "Run the text editor example");
    const run_text_editor_cmd = b.addRunArtifact(text_editor);
    run_text_editor_cmd.setCwd(b.path("examples"));
    run_text_editor_step.dependOn(&run_text_editor_cmd.step);
    run_text_editor_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_text_editor_cmd.addArgs(args);
    }

    // Audio example
    const audio = b.addExecutable(.{
        .name = "audio",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/audio.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    audio.root_module.linkSystemLibrary("SDL3", .{});
    b.installArtifact(audio);

    const run_audio_step = b.step("run-audio", "Run the audio example");
    const run_audio_cmd = b.addRunArtifact(audio);
    run_audio_step.dependOn(&run_audio_cmd.step);
    run_audio_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_audio_cmd.addArgs(args);
    }

    // Dialog example
    const dialog = b.addExecutable(.{
        .name = "dialog",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/dialog.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    dialog.root_module.linkSystemLibrary("SDL3", .{});
    b.installArtifact(dialog);

    const run_dialog_step = b.step("run-dialog", "Run the dialog example");
    const run_dialog_cmd = b.addRunArtifact(dialog);
    run_dialog_cmd.setCwd(b.path("examples"));
    run_dialog_step.dependOn(&run_dialog_cmd.step);
    run_dialog_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_dialog_cmd.addArgs(args);
    }

    // Process example
    const process = b.addExecutable(.{
        .name = "process",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/process.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    process.root_module.linkSystemLibrary("SDL3", .{});
    b.installArtifact(process);

    const run_process_step = b.step("run-process", "Run the process example");
    const run_process_cmd = b.addRunArtifact(process);
    run_process_step.dependOn(&run_process_cmd.step);
    run_process_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_process_cmd.addArgs(args);
    }

    // Clipboard example
    const clipboard = b.addExecutable(.{
        .name = "clipboard",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/clipboard.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    clipboard.root_module.linkSystemLibrary("SDL3", .{});
    b.installArtifact(clipboard);

    const run_clipboard_step = b.step("run-clipboard", "Run the clipboard example");
    const run_clipboard_cmd = b.addRunArtifact(clipboard);
    run_clipboard_step.dependOn(&run_clipboard_cmd.step);
    run_clipboard_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_clipboard_cmd.addArgs(args);
    }

    // Mixer example
    const mixer = b.addExecutable(.{
        .name = "mixer",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/mixer.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    b.installArtifact(mixer);

    const run_mixer_step = b.step("run-mixer", "Run the mixer example");
    const run_mixer_cmd = b.addRunArtifact(mixer);
    run_mixer_step.dependOn(&run_mixer_cmd.step);
    run_mixer_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_mixer_cmd.addArgs(args);
    }

    b.installArtifact(exe);

    const run_step = b.step("run", "Run the app");

    const run_cmd = b.addRunArtifact(exe);
    run_step.dependOn(&run_cmd.step);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const mod_tests = b.addTest(.{
        .root_module = mod,
    });
    mod_tests.root_module.linkSystemLibrary("SDL3", .{});

    const run_mod_tests = b.addRunArtifact(mod_tests);

    const exe_tests = b.addTest(.{
        .root_module = exe.root_module,
    });
    exe_tests.root_module.linkSystemLibrary("SDL3", .{});

    const run_exe_tests = b.addRunArtifact(exe_tests);

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_mod_tests.step);
    test_step.dependOn(&run_exe_tests.step);
}
