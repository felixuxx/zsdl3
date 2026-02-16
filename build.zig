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
    exe.linkSystemLibrary("SDL3");
    exe.linkSystemLibrary("SDL3_ttf");

    // Enhanced renderer visual test
    const enhanced_visual_test = b.addExecutable(.{
        .name = "test_enhanced_renderer_visual",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/test_enhanced_renderer_visual.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    enhanced_visual_test.linkSystemLibrary("SDL3");
    b.installArtifact(enhanced_visual_test);

    // Run step for enhanced renderer visual test
    const run_enhanced_visual_test_step = b.step("run-test-enhanced-renderer-visual", "Run the enhanced renderer visual test");
    const run_enhanced_visual_test_cmd = b.addRunArtifact(enhanced_visual_test);
    run_enhanced_visual_test_step.dependOn(&run_enhanced_visual_test_cmd.step);
    run_enhanced_visual_test_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_enhanced_visual_test_cmd.addArgs(args);
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
    cube_3d.linkSystemLibrary("SDL3");
    b.installArtifact(cube_3d);

    // Run step for cube_3d example
    const run_cube_3d_step = b.step("run-cube-3d", "Run the 3D cube example");
    const run_cube_3d_cmd = b.addRunArtifact(cube_3d);
    run_cube_3d_step.dependOn(&run_cube_3d_cmd.step);
    run_cube_3d_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cube_3d_cmd.addArgs(args);
    }

    // GPU API Test example
    const gpu_test = b.addExecutable(.{
        .name = "gpu_test",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/gpu_test.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    gpu_test.linkSystemLibrary("SDL3");
    b.installArtifact(gpu_test);

    // Run step for GPU test example
    const run_gpu_test_step = b.step("run-gpu-test", "Run the GPU API test");
    const run_gpu_test_cmd = b.addRunArtifact(gpu_test);
    run_gpu_test_step.dependOn(&run_gpu_test_cmd.step);
    run_gpu_test_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_gpu_test_cmd.addArgs(args);
    }

    // Image Test example
    const image_test = b.addExecutable(.{
        .name = "image_test",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/image_test.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    image_test.linkSystemLibrary("SDL3");
    image_test.linkSystemLibrary("SDL3_image");
    b.installArtifact(image_test);

    // Run step for Image test example
    const run_image_test_step = b.step("run-image-test", "Run the Image API test");
    const run_image_test_cmd = b.addRunArtifact(image_test);
    run_image_test_step.dependOn(&run_image_test_cmd.step);
    run_image_test_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_image_test_cmd.addArgs(args);
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
    basic_2d.linkSystemLibrary("SDL3");
    b.installArtifact(basic_2d);

    // Run step for basic_2d example
    const run_basic_2d_step = b.step("run-basic-2d", "Run the basic 2D example");
    const run_basic_2d_cmd = b.addRunArtifact(basic_2d);
    run_basic_2d_step.dependOn(&run_basic_2d_cmd.step);
    run_basic_2d_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_basic_2d_cmd.addArgs(args);
    }

    // TTF example
    const ttf_example = b.addExecutable(.{
        .name = "ttf_example",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/ttf_example.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "zsdl3", .module = mod },
            },
        }),
    });
    ttf_example.linkSystemLibrary("SDL3");
    ttf_example.linkSystemLibrary("SDL3_ttf");
    b.installArtifact(ttf_example);

    // Run step for ttf_example
    const run_ttf_example_step = b.step("run-ttf-example", "Run the TTF example");
    const run_ttf_example_cmd = b.addRunArtifact(ttf_example);
    run_ttf_example_step.dependOn(&run_ttf_example_cmd.step);
    run_ttf_example_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_ttf_example_cmd.addArgs(args);
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
    text_editor.linkSystemLibrary("SDL3");
    text_editor.linkSystemLibrary("SDL3_ttf");
    b.installArtifact(text_editor);

    // Run step for text_editor
    const run_text_editor_step = b.step("run-text-editor", "Run the text editor example");
    const run_text_editor_cmd = b.addRunArtifact(text_editor);
    run_text_editor_step.dependOn(&run_text_editor_cmd.step);
    run_text_editor_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_text_editor_cmd.addArgs(args);
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
    mod_tests.linkSystemLibrary("SDL3");

    // A run step that will run the test executable.
    const run_mod_tests = b.addRunArtifact(mod_tests);

    const exe_tests = b.addTest(.{
        .root_module = exe.root_module,
    });
    exe_tests.linkSystemLibrary("SDL3");

    // A run step that will run the second test executable.
    const run_exe_tests = b.addRunArtifact(exe_tests);

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_mod_tests.step);
    test_step.dependOn(&run_exe_tests.step);
}
