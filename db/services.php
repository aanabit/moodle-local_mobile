<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * External functions and service definitions.
 *
 * @package    local_mobile
 * @copyright  2014 Juan Leyva <juan@moodle.com>
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

defined('MOODLE_INTERNAL') || die;

$functions = array(

    // Cohort related functions.

    'local_mobile_core_calendar_get_calendar_events' => array(
        'classname'     => 'local_mobile_external',
        'methodname'    => 'core_calendar_get_calendar_events',
        'classpath'     => 'local/mobile/externallib.php',
        'description'   => 'Get calendar events',
        'type'          => 'read',
        'capabilities'  => 'moodle/calendar:manageentries', 'moodle/calendar:manageownentries', 'moodle/calendar:managegroupentries',
    ),
    'local_mobile_core_user_add_user_device' => array(
        'classname'     => 'local_mobile_external',
        'methodname'    => 'core_user_add_user_device',
        'classpath'     => 'local/mobile/externallib.php',
        'description'   => 'Store mobile user devices information for Push Notifications.',
        'type'          => 'write',
        'capabilities'  => '',
    ),
    'local_mobile_core_grades_get_grades' => array(
        'classname'     => 'local_mobile_external',
        'methodname'    => 'core_grades_get_grades',
        'classpath'     => 'local/mobile/externallib.php',
        'description'   => 'Returns grade item details and optionally student grades.',
        'type'          => 'read',
        'capabilities'  => 'moodle/grade:view, moodle/grade:viewall',
    ),
    'local_mobile_mod_forum_get_forum_discussions' => array(
        'classname'     => 'local_mobile_external',
        'methodname'    => 'mod_forum_get_forum_discussions',
        'classpath'     => 'local/mobile/externallib.php',
        'description'   => 'Returns a list of forum discussions contained within a given set of forums.',
        'type'          => 'read',
        'capabilities'  => 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting',
    ),
    'local_mobile_mod_forum_get_forum_discussion_posts' => array(
        'classname'     => 'local_mobile_external',
        'methodname'    => 'mod_forum_get_forum_discussion_posts',
        'classpath'     => 'local/mobile/externallib.php',
        'description'   => 'Returns a list of forum posts for a discussion.',
        'type'          => 'read',
        'capabilities'  => 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting',
    ),
    'local_mobile_core_message_get_messages' => array(
        'classname'     => 'local_mobile_external',
        'methodname'    => 'core_message_get_messages',
        'classpath'     => 'local/mobile/externallib.php',
        'description'   => 'Retrieve a list of messages send or received by a user (conversations, notifications or both)',
        'type'          => 'read',
        'capabilities'  => '',
    )

);

$services = array(
   'Moodle Mobile extended service'  => array(
        'functions' => array (
            'moodle_enrol_get_users_courses',
            'moodle_enrol_get_enrolled_users',
            'moodle_user_get_users_by_id',
            'moodle_webservice_get_siteinfo',
            'moodle_notes_create_notes',
            'moodle_user_get_course_participants_by_id',
            'moodle_user_get_users_by_courseid',
            'moodle_message_send_instantmessages',
            'core_course_get_contents',
            'core_get_component_strings',
            'local_mobile_core_message_get_messages',
            'local_mobile_core_calendar_get_calendar_events',
            'local_mobile_core_user_add_user_device',
            'local_mobile_core_grades_get_grades',
            'local_mobile_mod_forum_get_forum_discussions',
            'local_mobile_mod_forum_get_forum_discussion_posts'),
        'enabled' => 0,
        'restrictedusers' => 0,
        'shortname' => 'local_mobile',
        'downloadfiles' => 1,
        'uploadfiles' => 1
    ),
);